# This code is autogenerated

import pixie, json, times, strformat

from frameos/types import FrameOS, FrameScene, ExecutionContext
from frameos/logger import log
import apps/unsplash/app as unsplashApp
import apps/text/app as textApp
import apps/clock/app as clockApp
import apps/downloadImage/app as downloadImageApp
import apps/frameOSGallery/app as frameOSGalleryApp
import apps/ifElse/app as ifElseApp

let DEBUG = false

type Scene* = ref object of FrameScene
  app_cbef1661_d2f5_4ef8_b0cf_458c3ae11200: unsplashApp.App
  app_b94c5793_aeb1_4f3a_b273_c2305c12096e: textApp.App
  app_1c9414bd_8bc4_4249_8ffb_1b3094715a06: clockApp.App
  app_ddbd3753_ea6a_4a80_98b4_455fb623ef6b: downloadImageApp.App
  app_a8093aa9_a284_4d77_832f_ba0b8471da1e: frameOSGalleryApp.App
  app_9e11eaae_117e_4851_81ad_b3a1b07e6f15: textApp.App
  app_89732431_feb1_497b_8cc5_052676852d48: textApp.App
  app_7eae2352_afaf_4a97_97c0_467c359dbeea: textApp.App
  app_70980e99_9fff_45b4_adcd_9ca9985d4fb5: ifElseApp.App

{.push hint[XDeclaredButNotUsed]: off.}
proc runNode*(self: Scene, nodeId: string,
    context: var ExecutionContext) =
  let scene = self
  let frameOS = scene.frameOS
  let frameConfig = frameOS.frameConfig
  let state = scene.state
  var nextNode = nodeId
  var currentNode = nodeId
  var timer = epochTime()
  while nextNode != "-1":
    currentNode = nextNode
    timer = epochTime()
    case nextNode:
    of "cbef1661-d2f5-4ef8-b0cf-458c3ae11200":
      self.app_cbef1661_d2f5_4ef8_b0cf_458c3ae11200.run(context)
      nextNode = "-1"
    of "b94c5793-aeb1-4f3a-b273-c2305c12096e":
      self.app_b94c5793_aeb1_4f3a_b273_c2305c12096e.appConfig.text = &"Welcome to FrameOS!\nResolution: {context.image.width} x {context.image.height} .. " &
          scene.state{"magic"}.getStr()
      self.app_b94c5793_aeb1_4f3a_b273_c2305c12096e.appConfig.position = "top-left"
      self.app_b94c5793_aeb1_4f3a_b273_c2305c12096e.run(context)
      nextNode = "1c9414bd-8bc4-4249-8ffb-1b3094715a06"
    of "1c9414bd-8bc4-4249-8ffb-1b3094715a06":
      self.app_1c9414bd_8bc4_4249_8ffb_1b3094715a06.run(context)
      nextNode = "70980e99-9fff-45b4-adcd-9ca9985d4fb5"
    of "ddbd3753-ea6a-4a80-98b4-455fb623ef6b":
      self.app_ddbd3753_ea6a_4a80_98b4_455fb623ef6b.run(context)
      nextNode = "-1"
    of "a8093aa9-a284-4d77-832f-ba0b8471da1e":
      self.app_a8093aa9_a284_4d77_832f_ba0b8471da1e.run(context)
      nextNode = "b94c5793-aeb1-4f3a-b273-c2305c12096e"
    of "9e11eaae-117e-4851-81ad-b3a1b07e6f15":
      self.app_9e11eaae_117e_4851_81ad_b3a1b07e6f15.run(context)
      nextNode = "-1"
    of "89732431-feb1-497b-8cc5-052676852d48":
      self.app_89732431_feb1_497b_8cc5_052676852d48.run(context)
      nextNode = "-1"
    of "7eae2352-afaf-4a97-97c0-467c359dbeea":
      self.app_7eae2352_afaf_4a97_97c0_467c359dbeea.run(context)
      nextNode = "-1"
    of "70980e99-9fff-45b4-adcd-9ca9985d4fb5":
      self.app_70980e99_9fff_45b4_adcd_9ca9985d4fb5.appConfig.condition = false
      self.app_70980e99_9fff_45b4_adcd_9ca9985d4fb5.run(context)
      nextNode = "7eae2352-afaf-4a97-97c0-467c359dbeea"
    else:
      nextNode = "-1"
    if DEBUG:
      self.logger.log(%*{"event": "runApp", "node": currentNode, "ms": (-timer +
          epochTime()) * 1000})

proc dispatchEvent*(self: Scene, context: var ExecutionContext) =
  case context.event:
  of "render":
    self.runNode("a8093aa9-a284-4d77-832f-ba0b8471da1e", context)
  else: discard

proc init*(frameOS: FrameOS): Scene =
  var state = %*{}
  let frameConfig = frameOS.frameConfig
  let logger = frameOS.logger
  let scene = Scene(frameOS: frameOS, frameConfig: frameConfig, logger: logger, state: state)
  let self = scene
  var context = ExecutionContext(scene: scene, event: "init", eventPayload: %*{},
      image: newImage(1, 1))
  result = scene
  scene.execNode = (proc(nodeId: string,
      context: var ExecutionContext) = self.runNode(nodeId, context))
  scene.app_cbef1661_d2f5_4ef8_b0cf_458c3ae11200 = unsplashApp.init(
      "cbef1661-d2f5-4ef8-b0cf-458c3ae11200", scene, unsplashApp.AppConfig(
      cacheSeconds: 60.0, keyword: "birds"))
  scene.app_b94c5793_aeb1_4f3a_b273_c2305c12096e = textApp.init(
      "b94c5793-aeb1-4f3a-b273-c2305c12096e", scene, textApp.AppConfig(
      borderWidth: 2, fontColor: parseHtmlColor("#ffffff"), fontSize: 64.0,
      text: &"Welcome to FrameOS!\nResolution: {context.image.width} x {context.image.height} .. " &
      scene.state{"magic"}.getStr(), position: "top-left", offsetX: 0.0,
      offsetY: 0.0, padding: 10.0, borderColor: parseHtmlColor("#000000")))
  scene.app_1c9414bd_8bc4_4249_8ffb_1b3094715a06 = clockApp.init(
      "1c9414bd-8bc4-4249-8ffb-1b3094715a06", scene, clockApp.AppConfig(
      position: "bottom-center", format: "HH:mm:ss", formatCustom: "",
      offsetX: 0.0, offsetY: 0.0, padding: 10.0, fontColor: parseHtmlColor(
      "#ffffff"), fontSize: 32.0, borderColor: parseHtmlColor("#000000"),
      borderWidth: 1))
  scene.app_ddbd3753_ea6a_4a80_98b4_455fb623ef6b = downloadImageApp.init(
      "ddbd3753-ea6a-4a80-98b4-455fb623ef6b", scene, downloadImageApp.AppConfig(
      url: "http://10.4.0.11:4999/", scalingMode: "cover", cacheSeconds: 60.0))
  scene.app_a8093aa9_a284_4d77_832f_ba0b8471da1e = frameOSGalleryApp.init(
      "a8093aa9-a284-4d77-832f-ba0b8471da1e", scene,
      frameOSGalleryApp.AppConfig(category: "cute", scalingMode: "cover",
      cacheSeconds: 60.0))
  scene.app_9e11eaae_117e_4851_81ad_b3a1b07e6f15 = textApp.init(
      "9e11eaae-117e-4851-81ad-b3a1b07e6f15", scene, textApp.AppConfig(
      position: "bottom-left", text: "This is false", offsetX: 0.0,
      offsetY: 0.0, padding: 10.0, fontColor: parseHtmlColor("#ffffff"),
      fontSize: 32.0, borderColor: parseHtmlColor("#000000"), borderWidth: 1))
  scene.app_89732431_feb1_497b_8cc5_052676852d48 = textApp.init(
      "89732431-feb1-497b-8cc5-052676852d48", scene, textApp.AppConfig(
      position: "bottom-right", text: "This is true", offsetX: 0.0,
      offsetY: 0.0, padding: 10.0, fontColor: parseHtmlColor("#ffffff"),
      fontSize: 32.0, borderColor: parseHtmlColor("#000000"), borderWidth: 1))
  scene.app_7eae2352_afaf_4a97_97c0_467c359dbeea = textApp.init(
      "7eae2352-afaf-4a97-97c0-467c359dbeea", scene, textApp.AppConfig(
      position: "center-left", text: "This is next", offsetX: 0.0, offsetY: 0.0,
      padding: 10.0, fontColor: parseHtmlColor("#ffffff"), fontSize: 32.0,
      borderColor: parseHtmlColor("#000000"), borderWidth: 1))
  scene.app_70980e99_9fff_45b4_adcd_9ca9985d4fb5 = ifElseApp.init(
      "70980e99-9fff-45b4-adcd-9ca9985d4fb5", scene, ifElseApp.AppConfig(
      condition: false, thenNode: "89732431-feb1-497b-8cc5-052676852d48",
      elseNode: "9e11eaae-117e-4851-81ad-b3a1b07e6f15"))
  dispatchEvent(scene, context)

proc render*(self: Scene): Image =
  var context = ExecutionContext(
    scene: self,
    event: "render",
    eventPayload: %*{},
    image: case self.frameConfig.rotate:
    of 90, 270: newImage(self.frameConfig.height, self.frameConfig.width)
    else: newImage(self.frameConfig.width, self.frameConfig.height)
  )
  dispatchEvent(self, context)
  return context.image
{.pop.}
