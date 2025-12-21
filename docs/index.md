# Amethyst

A semi-opinionated, minimal, AI slop-free, and modular zsh config distribution. Serves as a replacement for a chunk of ohmyzsh, now that they've turned to AI slop.

## Features

### Defaults

The main feature of amethyst is the defaults. Zsh has a lot of cool features that, unfortunately, are disabled by default, and this distribution turns them on.

### Plugin manager

There are already plenty of plugin managers for zsh, but I'm reinventing the wheel because [a lot of them are overcomplicated abandonware](https://github.com/mattmc3/zsh_unplugged?tab=readme-ov-file#electric_plug-zsh-plugin-managers). Amethyst bundles a bare minimum plugin manager. 

It exclusively supports Git-based plugins. Unlike many other plugins, there's no default assumption that GitHub is the source of said plugins. A full URL has to be provided, which also makes it more easily compatible with private plugins, self-hosted versions of plugins, or self-hosted secret config as plugins without restricting what can be uploaded.
## Installing

Clone the repo:
```zsh
git clone https://github.com/LunarWatcher/amethyst ~/.config/amethyst
# OR:
git clone https://codeberg.org/LunarWatcher/amethyst ~/.config/amethyst
```

You can put it anywhere you want, just note the path. The recommended default is `~/.config/amethyst`[^1]. Then edit your zsh config:

```zsh
export AMETHYST_LOCATION=$HOME/.config/amethyst

# Amethyst is loaded with source statements. It requires more repeated lines of code, but it makes it much more explicit what gets loaded.
# The modules are primarily meant to be self-contained.

# The core module contains the defaults for zsh config, and certain core meta-commands for amethyst. This MUST be sourced,
# and it must be sourced prior to any other amethyst modules.
source $AMETHYST_LOCATION/modules/core.zsh
# The alias module contains the aliases that add to builtin commands (like ls -> `ls --color`)
source $AMETHYST_LOCATION/modules/aliases.zsh
# The plugin manager
source $AMETHYST_LOCATION/modules/plugin.zsh
# Not recommended, but it exists for convenience. Replaces any and all other source commands
# Note that this means sacrificing raw flexibility, and you get everything automatically.
# This may or may not be what you want to do.
# source $AMETYST_LOCATION/modules/everything.zsh

```
Example use of the plugin module:
```zsh
# Auto looks for `repo-name.plugin.zsh`, as is the standard in the anti* zsh package managers, as well as several others
amethyst-plugin auto 'https://github.com/zsh-users/zsh-syntax-highlighting'
# This cal also be an SSH url, assuming you have ssh certs set up
# All cloning goes via the git command, so if  you can `git clone` it, amethyst-plugin can too.
amethyst-plugin auto 'git@github.com:zsh-users/zsh-syntax-highlighting'
# If you prefer, you can load the plugin in manual mode
# In manual mode, an extra argument is required. This is the name of an environment variable to store the plugin path in.
amethyst-plugin manual 'https://github.com/zsh-users/zsh-syntax-highlighting' ZSH_SYNTAX_HIGHLIGHTING
source "$ZSH_SYNTAX_HIGHLIGHTING/zsh-syntax-highlighting.plugin.zsh"

# A special `theme` mode is also provided. In this mode, `repo-name.zsh-theme` is attempted sourced. If the theme you're trying to use
# doesn't have a `.zsh-theme` file, use manual mode.
# Unlike the other modes, this command can only be called once.
amethyst-plugin theme 'https://github.com/romkatv/powerlevel10k'
```

These commands are fully compatible with if statements. Do you have a plugin you only want to source under certain configurations? Wrap it in an if statement. The commands can also be executed at runtime, which allows for various forms of lazy loading.

### Minimal example

```zsh
# For p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export AMETHYST_LOCATION=$HOME/.config/amethyst

# Amethyst is loaded with source statements. It requires more repeated lines of code, but it makes it much more explicit what gets loaded.
# The modules are primarily meant to be self-contained.

# The core module contains the defaults for zsh config, and certain core meta-commands for amethyst. This MUST be sourced,
# and it must be sourced prior to any other amethyst modules.
source $AMETHYST_LOCATION/modules/core.zsh
# The alias module contains the aliases that add to builtin commands (like ls -> `ls --color`)
source $AMETHYST_LOCATION/modules/aliases.zsh
# The plugin manager
source $AMETHYST_LOCATION/modules/plugin.zsh
# Not recommended, but it exists for convenience. Replaces any and all other source commands
# Note that this means sacrificing raw flexibility, and you get everything automatically.
# This may or may not be what you want to do.
# source $AMETYST_LOCATION/modules/everything.zsh

# This should go at the end of the file, but can go immediately after amethyst is sourced.
# This is largely because both these particular plugins want to be sourced last, but you can ignore this 
# as long as your setup works
amethyst-plugin auto 'https://github.com/zsh-users/zsh-syntax-highlighting'
amethyst-plugin theme 'https://github.com/romkatv/powerlevel10k'
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
```

## Performance

Performance is not currently prioritised, but performance is primarily a function of how much crap you end up loading in your config. Because amethyst is minimal, the performance impact from the core loading is negligible. The major overhead comes from sourcing third-party plugins, and for now, a solution to that is not prioritised. 

If you load enough stuff that it becomes a problem, you could consider using [romkatv/zsh-defer](https://github.com/romkatv/zsh-defer); unfortunately, it's licensed under GPL, and I have never had enough of a problem with performance to warrant spending a bunch of time reinventing that wheel.

On my machine, it boots fast enough that I don't notice any slowness.

[^1]: I'm fairly certain this technically violates the xdg standard, but until someone rewrites the standard to be comprehensible, I don't care. It is a form of config, so it's close enough.
