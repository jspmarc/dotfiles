local wezterm = require('wezterm')

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function get_color_scheme()
	appearance = get_appearance()
	if appearance:find 'Dark' then
		return 'Darkside'
	else
		return 'catppuccin-latte'
	end
end

return {
	color_scheme = get_color_scheme(),
	font = wezterm.font_with_fallback({
		'JetBrainsMono Nerd Font Propo',
		'Noto Color Emoji',
		'Relaxed Typing Mono JP',
	}),
	font_size = 13,
	window_padding = {
		left = 8,
		right = 8,
		top = 0,
		bottom = 0,
	},
	window_background_opacity = 0.9,
	enable_wayland = false,
	window_decorations = 'NONE',
	enable_tab_bar = false,
	max_fps = 120,
}
