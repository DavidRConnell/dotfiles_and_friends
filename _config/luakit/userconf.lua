local modes = require("modes")
local settings = require("settings")

modes.remove_binds("normal", {"<Control-d>"})
modes.remap_binds("normal", {
	{"{", "gT"},
	{"}", "gt"},
})

modes.add_binds("completion", {
    { "<Control-n>", "Select next matching completion item.",
        function (w) w.menu:move_down() end },
    { "<Control-p>", "Select previous matching completion item.",
      function (w) w.menu:move_up() end },
})

local actions = { scroll = {
    up = {
        desc = "Scroll the current page up.",
        func = function (w, m) w:scroll{ yrel = -settings.get_setting("window.scroll_step")*(m.count or 1) } end,
    },
    down = {
        desc = "Scroll the current page down.",
        func = function (w, m) w:scroll{ yrel =  settings.get_setting("window.scroll_step")*(m.count or 1) } end,
    },
}}

modes.add_binds({"normal", "insert"}, {
    { "<Control-n>",  actions.scroll.down },
    { "<Control-p>",    actions.scroll.up },
})
modes.add_binds("command", {
    { "<Control-p>", "Open completion menu.", function (w) w:set_mode("completion") end },
})

modes.remap_binds("normal", {
	{"<Control-d>", "ZQ"},
})

local editor = require( "editor")
editor.editor_cmd = "alacritty -e nvim {file} +{line}"
