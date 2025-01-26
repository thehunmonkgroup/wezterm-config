-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.check_for_updates = false

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
--config.color_scheme = 'Solarized (dark) (terminal.sexy)'
config.color_scheme = 'Dracula (Official)'
--config.color_scheme = 'GruvboxDark'

config.font = wezterm.font 'UbuntuMono Nerd Font'
config.warn_about_missing_glyphs = false

config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true
config.skip_close_confirmation_for_processes_named = { 'flatpak-spawn' }

-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 10000
config.audible_bell = 'Disabled'

local action = wezterm.action
config.keys = {
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = action.ActivateTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = action.ActivateTabRelative(1),
  },
  {
    key = 'LeftArrow',
    mods = 'SHIFT|ALT',
    action = action.MoveTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'SHIFT|ALT',
    action = action.MoveTabRelative(1),
  },
  {
    key = 'c',
    mods = 'ALT',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'v',
    mods = 'ALT',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}

-- and finally, return the configuration to wezterm
return config
