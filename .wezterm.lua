-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- powershell7 windows
--config.default_prog = {'pwsh'}

--config.front_end = "WebGpu"
config.enable_wayland = true
-- This is wjhere you actually apply your config choices

config.font = wezterm.font("Maple Mono")
--config.color_scheme =  'Red Planet'
--config.color_scheme =  'Ryuuko'
config.font_size = 12.0
config.cell_width = 1.0
config.line_height = 1.0
config.window_background_opacity = 1.0
config.text_background_opacity = 1.00
--
config.keys = {

	-- paste from the clipboard
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },

	{ key = "C", mods = "CTRL", action = wezterm.action({ CopyTo = "Clipboard" }) },
	--{ key = "v", mods = "CTRL", action = wezterm.action({ PasteFrom = "Clipboard" }) },
	-- paste from the primary selection
	{ key = "v", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
	{ key = "t", mods = "CTRL", action = act.SpawnTab("DefaultDomain") },
	{ key = "t", mods = "SHIFT|ALT", action = act.SpawnTab("DefaultDomain") },
	--
}

--
for i = 1, 6 do
	table.insert(config.keys, {
		key = "F" .. tostring(i),
		action = act.ActivateTab(i - 1),
	})
end
-- and finally, return the configuration to wezterm
return config
