alias ..="cd .."
alias ~="cd ~"

zvm_after_lazy_keybindings() {
    bindkey -a k history-search-backward
    bindkey -a j history-search-forward
    bindkey -a H vi-beginning-of-line
    bindkey -a L vi-end-of-line
    bindkey -a / fzf-history-widget
    # \e works as meta.
    bindkey -v '\ep' history-search-backward
    bindkey -v '\en' history-search-forward
}
bindkey -v '^F' forward-char
bindkey -v '^@' fzf-tab-complete # ^@ is <C-Space>.
bindkey -v '^R' fzf-history-widget

export KEYTIMEOUT=1

# Prompt
fpath=("$ZDOTDIR" $fpath)
autoload -Uz prompt.zsh; prompt.zsh

# Window title
autoload -Uz add-zsh-hook

xterm_title_precmd () {
    print -Pn -- '\e]2;%~ \a'
}

xterm_title_preexec () {
    print -Pn -- "\\e\]2;${(q)1}: %~\a"
}

if [[ "$TERM" == alacritty* ]]; then
    add-zsh-hook -Uz precmd xterm_title_precmd
    add-zsh-hook -Uz preexec xterm_title_preexec
fi

compctl -g '*.md' md2pdf
compctl -g '*.ppt*' pptx2pdf
compctl -g '*.docx' docx2pdf

ZVM_CURSOR_STYLE_ENABLED=true

# Directories
WORDCHARS=${WORDCHARS//[\/=]} # Remove "/" and "=" so they are not part of words
setopt AUTO_PUSHD
setopt PUSHD_SILENT
alias d="dirs -v"
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Completion
autoload -Uz compinit; compinit
_comp_options+=(globdots)
source $ZDOTDIR/completion.zsh
