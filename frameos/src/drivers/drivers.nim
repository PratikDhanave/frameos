# This file is autogenerated.
# To add a new driver, make an entry in backend/app/models/drivers.py

import pixie
# import inkyPython/inkyPython as inkyDriver
# import frameBuffer/frameBuffer as frameBufferDriver

from frameos/types import Logger, FrameOS

# var inkyDriverInstance: inkyDriver.Driver
# var frameBufferDriverInstance: frameBufferDriver.Driver

proc init*(frameOS: FrameOS) =
  # inkyDriverInstance = inkyDriver.init(frameOS)
  # frameBufferDriverInstance = frameBufferDriver.init(frameOS)
  discard

proc render*(image: Image) =
  # inkyDriverInstance.render(image)
  # frameBufferDriverInstance.render(image)
  discard

proc turnOn*() =
  discard

proc turnOff*() =
  discard
