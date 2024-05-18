local wezterm = require("wezterm")

local act = wezterm.action

wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

local config = {
	color_scheme = "nord",
	font_size = 16.0,
	window_background_opacity = 0.85,
	font = wezterm.font_with_fallback({
		"Fira Code",
		"HackGen Console",
	}),
	use_ime = true,
	audible_bell = "Disabled",
	visual_bell = {
		fade_in_function = "EaseIn",
		fade_in_duration_ms = 150,
		fade_out_function = "EaseOut",
		fade_out_duration_ms = 150,
	},
	colors = {
		visual_bell = "#505050",
	},
	enable_scroll_bar = true,
	window_decorations = "RESIZE",
}

-- key bindings
-- config.disable_default_key_bindings = true
local keybinds = require("keybinds")
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables
config.leader = { key = "r", mods = "CTRL", timeout_milliseconds = 2001 }

-- status bar
require("status")
config.status_update_interval = 1000

return config
