# Purification
# by Matthieu Cneude
# https://github.com/Phantas0s/purification

# Based on:

# Purity
# by Kevin Lanni
# https://github.com/therealklanni/purity
# MIT License

# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

prompt_git_status() {
    local INDEX STATUS

    INDEX=$(command git status --porcelain -b 2> /dev/null)
    STATUS=""

    if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
	STATUS="%F{red}x%f"
    elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
	STATUS="%F{red}x%f"
    elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
	STATUS="%F{red}x%f"
    elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
	STATUS="%F{red}x%f"
    fi

    if [[ ! -z "$STATUS" ]]; then
	echo " $STATUS"
    else
	echo ""
    fi
}


prompt_git_branch() {
    autoload -Uz vcs_info
    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )
    setopt prompt_subst
    zstyle ':vcs_info:git:*' formats '%b'
}

prompt_git() {
    [ ! -z "$vcs_info_msg_0_" ] && echo "$vcs_info_msg_0_$(prompt_git_status) "
}

prompt_purity_precmd() {
    # Pass a line before each prompt
    print -P ''
}

prompt_user() {
    local user_identity=">"
    [ "$(whoami)" = "root" ] && local user_identity="#"
    echo "%B%F{%(?.green.red)}$user_identity%f%b"
}

prompt_purification_setup() {
    # Display git branch

    autoload -Uz add-zsh-hook
    add-zsh-hook precmd prompt_purity_precmd

    prompt_git_branch
    dir_prompt=" %F{magenta}%1~%f"
    git_prompt='$(prompt_git)'
    caret_prompt='$(prompt_user)'

    if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH2_CLIENT" ]]; then
	host_prompt="$(hostname):"
    else
	host_prompt=""
    fi

    PROMPT=" $git_prompt$caret_prompt "
    RPS1="$host_prompt%~"
}

prompt_purification_setup
