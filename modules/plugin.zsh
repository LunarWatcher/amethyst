local PLUGIN_REPO=${0:a:h:h}/plugins

mkdir -p $PLUGIN_REPO

function amethyst-plugin-help() {
    echo "Usage:"
    echo "  amethyst-plugin theme|auto|manual 'URL to a git repo' [Output variable; only used by manual mode]"
    echo "Examples:"
    echo "  amethyst-plugin theme 'https://github.com/romkatv/powerlevel10k'"
    # TODO: this is not great
    echo "  amethyst-plugin manual 'https://github.com/romkatv/powerlevel10k' POWERLEVEL_10K_LOCATION"
    echo "  amethyst-plugin auto 'https://github.com/zsh-users/zsh-syntax-highlighting'"
    echo 
    echo "Modes:"
    echo "  auto: Looks for a <repo-name>.plugin.zsh file"
    echo "  theme: looks for a <repo-name>.zsh-theme"
    echo "  manual: Only makes sure the repo exists. Sourcing needs to be done manually"
    echo "          In this form, the command takes an extra argument that specifies where"
    echo "          to store the path. Use this if you don't know what to use."
}

function check-exists() {
    local path="$PLUGIN_REPO/${1}"
    if [ -d "$path" ]; then
        return 0
    fi
    return 1
}

# TODO: this really should support --help
function amethyst-plugin() {
    local mode="${1}"
    local repo="${2}"
    local name="${${repo##*/}%.git}"
    if [ -z "$name" ]; then
        amethyst-plugin-help
        return 1
    elif [[ "$mode" != "theme" && "$mode" != "auto" && "$mode" != "manual" ]]; then
        amethyst-plugin-help
        return 1
    elif [[ "$name" == *"/"* ]]; then
        echo "Extracted repo name contains unexpected path elements. Aborting"
        return 2
    fi

    local plugin_loc="$PLUGIN_REPO/$name"
    if ! check-exists $name; then
        echo "Installing $repo"
        if ! git clone "$repo" "$plugin_loc"; then
            echo "Failed to clone $repo"
            return 1
        fi
    fi


    if [[ "$mode" == "theme" ]]; then
        local theme_file="$plugin_loc/$name.zsh-theme"
        if [ ! -f "$theme_file" ]; then
            echo "$theme_file does not exist. Use in manual mode instead"
            return 2
        fi
        source "$theme_file"
    elif [[ "$mode" == "auto" ]]; then
        local plugin_file="$plugin_loc/$name.plugin.zsh"
        if [ ! -f "$plugin_file" ]; then
            echo "$plugin_file does not exist. Use in manual mode instead"
            return 2
        fi
        source "$plugin_file"
    elif [[ "$mode" == "manual" ]]; then
        local output="${3}"
        if [ -z "$output" ]; then
            amethyst-plugin-help
            return 1
        fi
        # TODO: test that this actually works
        export "${output}"="$plugin_loc"
    fi

    export fpath=("$plugin_loc" $fpath)
    # TODO: this might tank performance? but not sure how to better integrate it. Would need an extra function that
    # signals plugin end likely, since plugin loading isn't managed by amethyst
    compinit
}
