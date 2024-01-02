import httpclient, zippy, json, sequtils, os, times

from frameos/types import FrameConfig, Logger

type
  LoggerThread = ref object
    frameConfig: FrameConfig
    client: HttpClient
    url: string
    logs: seq[JsonNode]
    erroredLogs: seq[JsonNode]
    lastSendAt: float

const LOG_FLUSH_SECONDS = 1.0

var
  thread: Thread[FrameConfig]
  logChannel*: Channel[JsonNode]

logChannel.open()

proc logInThread*(self: LoggerThread) =
  var newLogs = self.erroredLogs.concat(self.logs)
  self.logs = @[]
  self.erroredLogs = @[]
  if newLogs.len == 0:
    return
  if newLogs.len > 100:
    newLogs = newLogs[(newLogs.len - 100) .. (newLogs.len - 1)]
  try:
    let body = %*{"logs": newLogs}
    let response = self.client.request(self.url, httpMethod = HttpPost,
        body = compress($body))
    self.lastSendAt = epochTime()
    if response.code != Http200:
      echo "Error sending logs: HTTP " & $response.status
      self.erroredLogs = self.erroredLogs.concat(newLogs)
  except CatchableError as e:
    echo "Error sending logs: " & $e.msg
    self.erroredLogs = self.erroredLogs.concat(newLogs)

proc start(self: LoggerThread) =
  while true:
    let logCount = (self.logs.len + self.erroredLogs.len)
    if logCount > 10 or (logCount > 0 and self.lastSendAt + LOG_FLUSH_SECONDS <
        epochTime()):
      self.logInThread()

    let (success, payload) = logChannel.tryRecv()
    if success:
      self.logs.add(payload)
    else:
      sleep(100)

proc createThreadRunner(frameConfig: FrameConfig) {.thread.} =
  var client = newHttpClient(timeout = 10000)
  client.headers = newHttpHeaders([
      ("Authorization", "Bearer " & frameConfig.serverApiKey),
      ("Content-Type", "application/json"),
      ("Content-Encoding", "gzip")
  ])
  let protocol = if frameConfig.serverPort mod 1000 ==
      443: "https" else: "http"
  let url = protocol & "://" & frameConfig.serverHost & ":" &
    $frameConfig.serverPort & "/api/log"

  var loggerThread = LoggerThread(
    frameConfig: frameConfig,
    client: client,
    url: url,
    logs: @[],
    erroredLogs: @[],
    lastSendAt: 0.0,
  )
  loggerThread.start()

proc newLogger*(frameConfig: FrameConfig): Logger =
  createThread(thread, createThreadRunner, frameConfig)
  var logger = Logger(
    frameConfig: frameConfig,
    channel: logChannel,
    enabled: true,
  )
  logger.log = proc(payload: JsonNode) =
    if logger.enabled:
      logChannel.send(payload)
  logger.enable = proc() =
    logger.enabled = true
  logger.disable = proc() =
    logger.enabled = false
  result = logger
