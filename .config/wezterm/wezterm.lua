-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, user the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- 上記は定型文
-- 以下からconfigに各種設定を記載

-- フォントサイズ
config.font_size = 16.0
-- 背景の非透過率
config.window_background_opacity = 0.80
-- 背景のぼかし
config.macos_window_background_blur = 20

-- IME有効化
config.use_ime   = true
-- タイトルバー削除
config.window_decorations = "RESIZE"
-- タブを下に表示（デフォルトでは上）
-- config.tab_bar_at_bottom = true
-- タブが一つの時はタブバーを出さない
config.hide_tab_bar_if_only_one_tab = true
-- タブバーの+を削除
config.show_new_tab_button_in_tab_bar = false
-- タブバーのxを削除(nightlyでのみ使用可能)
-- config.show_close_tab_button_in_tabs = false
-- タブ同士の境界線を非表示
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle
-- アクティブタブに色をつける
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

return config
