local tabline_config = require("tabby.presets").active_wins_at_tail
local separator = require("tabby.text").separator
local primary = separator("", "TabLineSel", "TabLineFill")
local secondary = separator("", "TabLine", "TabLineFill")
tabline_config.head = {}
tabline_config.active_tab.left_sep = primary
tabline_config.active_tab.right_sep = primary
tabline_config.inactive_tab.left_sep = secondary
tabline_config.inactive_tab.right_sep = secondary
tabline_config.top_win.left_sep = secondary
tabline_config.top_win.right_sep = secondary
tabline_config.win.left_sep = secondary
tabline_config.win.right_sep = secondary
tabline_config.tail = {}

require("tabby").setup { tabline = tabline_config }
