import json, jester, pixie
import std/locks

type
  FrameConfig* = ref object
    serverHost*: string
    serverPort*: int
    serverApiKey*: string
    framePort*: int
    width*: int
    height*: int
    device*: string
    color*: string
    interval*: float
    metricsInterval*: float
    rotate*: int
    scalingMode*: string
    backgroundColor*: string
    settings*: JsonNode

  Logger* = ref object
    frameConfig*: FrameConfig
    lock*: Lock
    thread*: Thread[FrameConfig]
    channel*: Channel[JsonNode]
    log*: proc(payload: JsonNode)

  FrameScene* = ref object of RootObj
    frameConfig*: FrameConfig
    logger*: Logger
    state*: JsonNode
    execNode*: proc(nodeId: string, context: var ExecutionContext)

  ExecutionContext* = ref object
    scene*: FrameScene
    image*: Image
    event*: string
    eventPayload*: JsonNode
    parent*: ExecutionContext
    loopIndex*: int
    loopKey*: string

  RunnerControl* = ref object
    logger*: Logger
    frameConfig*: FrameConfig
    sendEvent*: proc (event: string, data: JsonNode)
    start*: proc()

  Server* = ref object
    frameConfig*: FrameConfig
    logger*: Logger
    jester*: Jester
    runner*: RunnerControl
    url*: string

  FrameOSDriver* = ref object of RootObj
    name*: string

  FrameOS* = ref object
    frameConfig*: FrameConfig
    logger*: Logger
    server*: Server
    runner*: RunnerControl
