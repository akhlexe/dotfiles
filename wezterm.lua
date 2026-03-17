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
-- Las terminales antiguas no distinguen bien:
-- Ctrl+i
-- Tab
--
-- o
--
-- Ctrl+m
-- Enter
--
-- Porque envian el mismo codigo ascii
--
-- Entonces CSI-u encoding es un estandar moderno que permite enviar teclas como:
-- Ctrl+Shift+Alt+Key
-- sin colisiones
config.enable_csi_u_key_encoding = true

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
	background = "#1F2335",
	foreground = "#c0caf5",
	cursor_bg = "#c0caf5",
	cursor_border = "#c0caf5",
	cursor_fg = "#1d202f",
	selection_bg = "#a9b1d6",
	selection_fg = "c0caf5",
	ansi = {
		"#15161e",
		"#f7768e",
		"#9ece6a",
		"#e0af68",
		"#7aa2f7",
		"#bb9af7",
		"#7dcfff",
		"#a9b1d6",
	},
	brights = {
		"#414868",
		"#f7768e",
		"#9ece6a",
		"#e0af68",
		"#7aa2f7",
		"#bb9af7",
		"#7dcfff",
		"#c0caf5",
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
