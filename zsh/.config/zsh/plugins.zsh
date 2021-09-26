#! /bin/zsh

export ZINIT_HOME=$HOME/.local/lib/zsh/zinit

if [ ! -d "$ZINIT_HOME" ]; then
    git clone https://github.com/zdharma/zinit.git $ZINIT_HOME/bin
fi
source $ZINIT_HOME/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit_load() {
    if [ ${plugin%:*} = "omz" ]; then
        zinit snippet OMZP::${plugin#omz:} 2>/dev/null
    else
        zinit light $plugin
    fi
}

load_plugins() {
    for plugin in $plugins; do
        if [ ${plugin#*@} = "delay" ]; then
            plugin=${plugin%@delay}
            zinit ice lucid wait
        fi

        zinit_load $plugin
    done

    unset plugin
}
load_plugins
