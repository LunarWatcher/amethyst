local AMETHYST_REPO=${0:a:h:h}
# Features {{{
autoload -U add-zsh-hook compinit zrecompile
# }}}
# Uncategorised stuff{{{
# I do not understand what extended_glob does, but all the decent guides say to use it, and the 
# wiki shows some cursed zsh I don't understand, but I guess it doesn't hurt
setopt extended_glob

setopt interactive_comments
# }}}
# History stuff {{{
export HISTFILE="$HOME/.zsh_history"    # History filepath
export HISTSIZE=50000
export SAVEHIST=10000

setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt hist_fcntl_lock
setopt share_history

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
# }}}
# Dir state {{{
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
# }}}
# zle {{{
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# }}}
# Autocomplete {{{
unsetopt autocd

compinit

# TODO: Revise the standard completion settings. Not a huge fan of this 
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

setopt complete_in_word

zmodload zsh/nearcolor

# }}}
# Keybinds {{{
bindkey "^[[1;5C" forward-word # ctrl-right
bindkey "^[[1;5D" backward-word # ctrl-left
bindkey "^[[3;5~" kill-word # ctrl-delete
# }}}
# Word boundaries {{{
# Not sure how much of this is actually necessary
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>/ '$'\n'
autoload -Uz select-word-style
select-word-style normal
zstyle ':zle:*' word-style unspecified
# }}}
# Terminal titles {{{
function precmd_title() {
    if [[ -n "$SSH_CONNECTION" ]]; then
        print -Pn "\e]0;%n@%m: %~\a"
    else
        print -Pn "\e]0;%~\a"
    fi
}
function preexec_title() {
    print -Pn "\e]0;%n@%m: %~ - $2\a"
}

add-zsh-hook preexec preexec_title
add-zsh-hook precmd precmd_title
# }}}
# Meta-commands {{{
# TODO: Figure out how I get non-API functions to not pollute the global namespace
function _amethyst_update() {
    (cd "$AMETHYST_REPO" && git pull)
}
function amethyst() {
    local command="${1}"
    if [ -z "$command" ]; then
        echo "Usage: amethyst update"
        return 0
    fi
    shift
    if [[ "$command" == "update" ]];
    then
        echo "Updating amethyst..."
        _amethyst_update $@
    else
        echo "Unknown command: ${command}"
        echo "Usage: amethyst update"
    fi
}
# }}}
