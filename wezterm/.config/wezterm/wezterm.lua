local wezterm = require('wezterm')

return {
	color_scheme = 'Darkside',
	font = wezterm.font_with_fallback({
		'JetBrainsMono Nerd Font Propo',
		'Noto Color Emoji',
		'Relaxed Typing Mono JP',
	}),
	font_size = 11,
	window_padding = {
		left = 8,
		right = 8,
		top = 0,
		bottom = 0,
	},
	window_background_opacity = 0.9,
	enable_wayland = false,
}
