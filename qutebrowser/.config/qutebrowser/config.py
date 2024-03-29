#!/usr/bin/env python3

from colorschemes import modus as theme

theme.draw(c, {"spacing": {"vertical": 6, "horizontal": 8}})

c.tabs.tabs_are_windows = True
c.tabs.title.format = "{audio} {current_title}"

c.downloads.remove_finished = 5000
c.hints.mode = "letter"
c.hints.chars = "aoeuhtns"
c.input.partial_timeout = 60000
c.editor.command = ["emacsclient", "-ca ''", "{file}"]
c.bindings.key_mappings = {
    "<Ctrl-[>": "<Escape>",
    "<Ctrl-G>": "<Escape>",
    "<Ctrl-6>": "<Ctrl-^>",
    "<Ctrl-M>": "<Return>",
    "<Ctrl-J>": "<Return>",
    "<Shift-Return>": "<Return>",
    "<Enter>": "<Return>",
    "<Shift-Enter>": "<Return>",
    "<Ctrl-Enter>": "<Ctrl-Return>",
    "<Ctrl-Space>": "<Tab>",
}

config.load_autoconfig()
c.zoom.default = 90

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
config.bind("<Ctrl-I>", "edit-text", mode="insert")

# local-leader-esque bindings
config.bind("<Ctrl-Space>c", "config-edit", mode="normal")
config.bind("<Ctrl-Space>e", "spawn --userscript open-in-emacs.sh", mode="normal")
config.bind("<Ctrl-Space>.", "config-source", mode="normal")
config.bind("<Ctrl-Space>y", "spawn --userscript yt-dlp-to-downloads.sh", mode="normal")
config.bind("<Ctrl-Space>m", "spawn mpv {url}", mode="normal")
config.bind("<Ctrl-Space>g", "spawn --userscript git-clone-repo-and-open.sh", mode="normal")
config.bind("<Ctrl-Space>G", "spawn --userscript git-clone-repo-no-open.sh", mode="normal")

config.bind("O", "set-cmd-text -s :open -w", mode="normal")
config.bind("Pp", "open -w -- {clipboard}", mode="normal")
config.bind("PP", "open -w -- {primary}", mode="normal")
config.bind("<Ctrl-P>", "hint links fill :open -p {hint-url}", mode="normal")
config.bind("<Ctrl-SHIFT-P>", "open -p", mode="normal")
config.bind("F", "hint all tab-bg", mode="normal")
config.bind("<Ctrl-/>", "hint all", mode="normal")
config.bind("<Alt-/>", "hint links yank", mode="normal")


config.unbind("<Ctrl-W>")
config.bind("<Ctrl-D>", "quit --save", mode="normal")
config.bind("<Ctrl-I>", "forward", mode="normal")
config.bind("<Ctrl-O>", "back", mode="normal")

config.bind("m", "mode-enter set_mark", mode="normal")
config.bind("<Ctrl-m>", "mode-enter jump_mark", mode="normal")
config.bind("M", "quickmark-save", mode="normal")

# Downloads
config.unbind("D", mode="normal")
config.bind("Dc", "download-cancel", mode="normal")
config.bind("DC", "download-clear", mode="normal")
config.bind("Dd", "download-delete", mode="normal")
config.bind("Do", "download-open", mode="normal")
config.bind("DR", "download-remove", mode="normal")
config.bind("Dr", "download-retry", mode="normal")
config.bind("Dv", "spawn mpv {url}", mode="normal")

config.bind(";v", "hint links spawn mpv {hint-url}", mode="normal")

config.bind("L", "move-to-end-of-line", mode="caret")
config.bind("H", "move-to-start-of-line", mode="caret")

# Org-roam
config.bind(
    "<Ctrl-r>",
    (
       "open javascript:location.href='org-protocol://roam-ref?template=b'+" + 
       "'&ref='+encodeURIComponent(location.href)+" +
       "'&title='+encodeURIComponent(document.title)+" +
       "'&body='+encodeURIComponent(window.getSelection())"
    ),
)

config.bind(
    ";r",
    "hint links userscript add-entry-from-doi.sh",
)

config.bind(
    ";p",
    "hint links userscript preview-pdf.sh",
)

config.bind(
    ";n",
    "hint links userscript nix-prefetch-to-clip.sh",
)

config.bind(
    ";m",
    "hint links spawn mpv {hint-url}",
)

c.content.headers.user_agent = "Mozilla/5.0 (X11; Linux x86_64; rv:106.0) Gecko/20100101 Firefox/106.0"
