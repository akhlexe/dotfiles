-- ╔══════════════════════════════════════════════════════════════════════════════╗
-- ║                              WEZTERM config                                  ║
-- ║                           Optimized for Neovim                               ║
-- ╚══════════════════════════════════════════════════════════════════════════════╝

local wezterm = require("wezterm")
local config = {}

-- ┌──────────────────────────────────────────────────────────────────────────────┐
-- │                                   FONT                                       │
-- └──────────────────────────────────────────────────────────────────────────────┘

config.font = wezterm.font("JetBrains Mono", { weight = "Regular" })
config.font_size = 14
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- ┌──────────────────────────────────────────────────────────────────────────────┐
-- │                                  WINDOW                                      │
-- └──────────────────────────────────────────────────────────────────────────────┘

config.window_background_opacity = 0.95

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.enable_scroll_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- ┌──────────────────────────────────────────────────────────────────────────────┐
-- │                                  CURSOR                                      │
-- └──────────────────────────────────────────────────────────────────────────────┘

config.default_cursor_style = "BlinkingBar"

-- ┌──────────────────────────────────────────────────────────────────────────────┐
-- │                            NEOVIM OPTIMIZATIONS                              │
-- └──────────────────────────────────────────────────────────────────────────────┘

-- Terminal & Colors
-- WSL doesn't have wezterm terminfo, so we use xterm-256color there
-- See: https://github.com/Gentleman-Programming/Gentleman.Dots/issues/117
if wezterm.target_triple:find("windows") then
	config.term = "xterm-256color"
else
	config.term = "wezterm"
end

-- Nuevo encoding de teclas.
-- Muy importante para neovim moderno.
config.enable_csi_u_key_encoding = true
config.allow_win32_input_mode = false
-- config.enable_kitty_keyboard = true

-- Undercurl support (LSP diagnostics, spelling)
-- "undercurl" es el subrayado ondulado ~~~~~ que usa LSP para marcar warnings y errores.
config.underline_thickness = 2 -- 1: muy fina, 2: mas visible
config.underline_position = -2 -- que tan lejos está del texto.

-- Scrollback
-- Se aumenta cantidad de lineas que guarda el terminal hay atrás.
-- Lo normal suele ser 3500.
config.scrollback_lines = 10000

-- Performance
config.max_fps = 240

-- Image support
config.enable_kitty_graphics = true

-- Input handling
-- las dead keys son teclas que esperan otra tecla para componer un caracter
-- ejemplo: el tilde
-- ´ + a = á
config.use_dead_keys = false
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- ┌──────────────────────────────────────────────────────────────────────────────┐
-- │                           GENTLEMAN THEME                                    │
-- └──────────────────────────────────────────────────────────────────────────────┘
config.colors = {
	foreground = "#c8c093",
	background = "#0d0c0c",

	cursor_bg = "#c8c093",
	cursor_fg = "#0d0c0c",
	cursor_border = "#c8c093",

	selection_fg = "#c8c093",
	selection_bg = "#2a2a37",

	scrollbar_thumb = "#2a2a37",

	ansi = {
		"#0d0c0c", -- black
		"#c4746e", -- red
		"#8a9a7b", -- green
		"#c4b28a", -- yellow
		"#8ba4b0", -- blue
		"#a292a3", -- magenta
		"#8ea4a2", -- cyan
		"#c8c093", -- white
	},

	brights = {
		"#a6a69c", -- bright black (gray)
		"#e46876", -- bright red
		"#87a987", -- bright green
		"#e6c384", -- bright yellow
		"#7fb4ca", -- bright blue
		"#938aa9", -- bright magenta
		"#7aa89f", -- bright cyan
		"#c8c093", -- bright white
	},
}

-- ┌──────────────────────────────────────────────────────────────────────────────┐
-- │                                    WSL                                       │
-- └──────────────────────────────────────────────────────────────────────────────┘

config.default_domain = "WSL:Ubuntu-24.04"
config.front_end = "OpenGL"

-- ┌──────────────────────────────────────────────────────────────────────────────┐
-- │                                    BELL                                      │
-- └──────────────────────────────────────────────────────────────────────────────┘
config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_duration_ms = 0,
	fade_out_duration_ms = 0,
}

return config
