#!/usr/bin/env python3

from colorschemes import onedark as theme

theme.draw(c, {"spacing": {"vertical": 6, "horizontal": 8}})

c.hints.mode = "letter"
c.hints.chars = "aoeuhtns"
c.input.partial_timeout = 60000
c.fonts.monospace = "hack nerd font"
c.url.start_pages = ["https://en.wikipedia.org/wiki/Special:Random"]
c.url.default_page = "https://en.wikipedia.org/wiki/Special:Random"
c.editor.command = ["emacsclient", "-c", "{file}"]
c.bindings.key_mappings = {
    "<Ctrl-[>": "<Escape>",
    "<Ctrl-6>": "<Ctrl-^>",
    "<Ctrl-M>": "<Return>",
    "<Ctrl-J>": "<Return>",
    "<Shift-Return>": "<Return>",
    "<Enter>": "<Return>",
    "<Shift-Enter>": "<Return>",
    "<Ctrl-Enter>": "<Ctrl-Return>",
    "<Ctrl-Space>": "<Tab>",
}

config.bind('<Ctrl-Space>', 'completion-item-fucus next', mode='command')
config.bind('<Ctrl-Space>', 'completion-item-fucus next', mode='prompt')
config.unbind("<Ctrl-N>")
config.unbind("<Ctrl-P>")
config.bind("<Ctrl-N>", "completion-item-focus --history next", mode="command")
config.bind("<Ctrl-P>", "completion-item-focus --history prev", mode="command")
config.bind("<Ctrl-N>", "prompt-item-focus next", mode="prompt")
config.bind("<Ctrl-P>", "prompt-item-focus prev", mode="prompt")



config.unbind("<Ctrl-W>")
config.bind("<Ctrl-D>", "close", mode="normal")
config.bind("<Ctrl-I>", "forward", mode="normal")
config.bind("<Ctrl-O>", "back", mode="normal")
c.colors.keyhint.suffix.fg = "#50fa7b"
c.colors.hints.fg = "#50fa7b"
