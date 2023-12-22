import std/json
from ../config import Config, loadConfig

block test_load_config:
    let config = loadConfig("./src/tests/assets/frame.json")
    doAssert config.serverHost == "127.0.0.1"
    doAssert config.serverPort == 8999
    doAssert config.serverApiKey == "test-api-key"
    doAssert config.width == 800
    doAssert config.height == 480
    doAssert config.device == "web_only"
    doAssert config.color == "black" # null in frame.json
    doAssert config.interval == 300
    doAssert config.metrics_interval == 60 # 60.0 in frame.json
    doAssert config.rotate == 0
    doAssert config.scalingMode == "cover"
    doAssert config.backgroundColor == "blue" # not the default
    doAssert config.settings == %*{"sentry": {"frame_dsn": nil}}
    doAssert config.settings{"sentry"} == %*{"frame_dsn": nil}
    doAssert config.settings{"sentry"}{"not_found"} == nil
    doAssert config.settings{"sentry"}{"frame_dsn"} != nil
    doAssert config.settings{"sentry"}{"frame_dsn"}.kind == JNull
    doAssert config.settings{"sentry"}{"frame_dsn"}.getStr() == ""
    doAssert config.settings{"nothere"}{"neitherme"}{"orme"} == nil
    doAssert config.settings{"nothere"}{"neitherme"}{"orme"}.getStr() == ""
    doAssert config.settings{"nothere"}{"neitherme"}{"orme"}.isNil() == true
