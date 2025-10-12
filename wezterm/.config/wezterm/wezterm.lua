local wezterm = require('wezterm')

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return 'Dark'
end

local function get_color_scheme()
	-- local appearance = get_appearance()
	-- if appearance:find('Dark') then
	-- 	return 'Darkside'
	-- else
	-- 	return 'catppuccin-latte'
	-- end
	return 'Darkside'
end

local is_linux = wezterm.target_triple:find('linux') ~= nil
local is_darwin = wezterm.target_triple:find('darwin') ~= nil
local keys = {
	{ key = 'Enter', mods = 'SHIFT', action = wezterm.action({ SendString = '\x1b\r' }) },
}
if is_darwin then
	table.insert(keys, {
		key = 'Enter',
		mods = 'ALT',
		action = wezterm.action.DisableDefaultAssignment,
	})
end

return {
	color_scheme = get_color_scheme(),
	font = wezterm.font_with_fallback({
		'JetBrainsMono Nerd Font Propo',
		'Noto Color Emoji',
		'Relaxed Typing Mono JP',
	}),
	font_size = is_darwin and 13 or 11,
	window_padding = {
		left = 8,
		right = 8,
		top = 0,
		bottom = 0,
	},
	window_background_opacity = 0.9,
	enable_wayland = true,
	window_decorations = is_linux and 'NONE' or 'TITLE | RESIZE',
	enable_tab_bar = false,
	max_fps = 120,
	keys = keys,
	front_end = 'WebGpu',
}
