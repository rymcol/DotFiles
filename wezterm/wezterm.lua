local wezterm = require("wezterm")

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]

return {
  -- Make Catpuccin
  color_schemes = {
    ["OLEDppuccin"] = custom,
  },
  color_scheme = "OLEDppuccin",

  -- Hacked Font --
  font = wezterm.font 'Hack Nerd Font',
  
  -- Make Bigger by Default --
  initial_cols = 135,
  initial_rows = 40,

  -- Window Style --
  window_decorations = "RESIZE",
  window_background_opacity = 0.95,
    
  -- Fancy Tabs --
  use_fancy_tab_bar = true,
  tab_bar_at_bottom = true,
}
