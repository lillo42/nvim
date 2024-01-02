-- Pull in the wezterm API
local wezterm = require("wezterm")


-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font "JetBrains Mono"
config.color_scheme = "Lab Fox"
config.force_reverse_video_cursor = true
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

return config

