# This file is autogenerated.
# To add a new driver, make an entry in backend/app/models/drivers.py

import pixie
# import inky/inky as inkyDriver
# import frameBuffer/frameBuffer as frameBufferDriver

from frameos/types import FrameOS

proc init*(frameOS: FrameOS) =
  # inkyDriver.init(frameOS)
  # frameBufferDriver.init(frameOS)
  discard

proc render*(frameOS: FrameOS, image: Image) =
  # inkyDriver.render(frameOS, image)
  # frameBufferDriver.render(frameOS, image)
  discard
