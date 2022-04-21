local wezterm = require('wezterm')

return {
	color_scheme = 'Darkside',
	font = wezterm.font_with_fallback({
		'Fira Code Nerd Font',
		'Noto Color Emoji',
	}),
	harfbuzz_features = { 'zero', 'cv18', 'cv30', 'ss05', 'ss06' },
	window_padding = {
		left = 8,
		right = 8,
		top = 0,
		bottom = 0,
	},
}
