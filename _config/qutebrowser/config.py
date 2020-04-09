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

config.unbind("<Ctrl-N>")
config.unbind("<Ctrl-P>")
config.bind("<Ctrl-N>", "completion-item-focus --history next", mode="command")
config.bind("<Ctrl-P>", "completion-item-focus --history prev", mode="command")
config.bind("<Ctrl-N>", "prompt-item-focus next", mode="prompt")
config.bind("<Ctrl-P>", "prompt-item-focus prev", mode="prompt")

config.bind("<Ctrl-W>", "fake-key <Ctrl-Shift-Left>;; fake-key <Delete>", mode="insert")
config.bind("<Ctrl-U>", "fake-key <Shift-Home>;; fake-key <Delete>", mode="insert")
config.bind("<Ctrl-K>", "fake-key <Shift-End>;; fake-key <Delete>", mode="insert")
config.bind("<Ctrl-A>", "fake-key <Home>", mode="insert")
config.bind("<Ctrl-E>", "fake-key <End>", mode="insert")
config.bind("<Ctrl-L>", "fake-key <Right>", mode="insert")
config.bind("<Ctrl-H>", "fake-key <Left>", mode="insert")
config.bind("<Ctrl-F>", "fake-key <Ctrl-Right>", mode="insert")
config.bind("<Ctrl-B>", "fake-key <Ctrl-Left>", mode="insert")
config.bind("<Ctrl-P>", "fake-key <Up>", mode="insert")
config.bind("<Ctrl-N>", "fake-key <Down>", mode="insert")

config.bind("<Ctrl-P>", "hint links fill :open -p {hint-url}", mode="normal")
config.bind("<Ctrl-SHIFT-P>", "open -p", mode="normal")
config.bind("F", "hint all tab-bg", mode="normal")
config.bind("{", "tab-prev", mode="normal")
config.bind("}", "tab-next", mode="normal")


config.unbind("<Ctrl-W>")
config.bind("<Ctrl-D>", "close", mode="normal")
config.bind("<Ctrl-I>", "forward", mode="normal")
config.bind("<Ctrl-O>", "back", mode="normal")

config.bind("m", "enter-mode set_mark", mode="normal")
config.bind("<Ctrl-m>", "enter-mode jump_mark", mode="normal")
config.bind("M", "quickmark-save", mode="normal")

# Downloads
config.unbind("D", mode="normal")
config.bind("Dc", "download-cancel", mode="normal")
config.bind("DC", "download-clear", mode="normal")
config.bind("Dd", "download-delete", mode="normal")
config.bind("Do", "download-open", mode="normal")
config.bind("DR", "download-remove", mode="normal")
config.bind("Dr", "download-retry", mode="normal")

config.bind("L", "move-to-end-of-line", mode="caret")
config.bind("H", "move-to-start-of-line", mode="caret")

c.colors.keyhint.suffix.fg = "#50fa7b"
c.colors.hints.fg = "#50fa7b"
