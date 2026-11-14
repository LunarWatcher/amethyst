---
{
    "title": "Getting started"
}
---
# Getting started

Clone the repo:
```zsh
git clone https://codeberg.org/LunarWatcher/amethyst ~/.config/amethyst
# Or with the GitHub mirror:
git clone https://github.com/LunarWatcher/amethyst ~/.config/amethyst
```

You can put it anywhere you want, just make sure you make a note of where you do put it. The recommended default is `~/.config/amethyst`. Then edit your zsh config:

```zsh
# If you didn't clone to the default location, edit this.
export AMETHYST_LOCATION=$HOME/.config/amethyst

# Amethyst is loaded with source statements. It requires more repeated lines of code, but it makes it much more explicit what gets loaded.
# The modules are primarily meant to be self-contained, with the exception of the
# core module, as it contains a lot of the meta tools for amethyst.

# The core module contains the defaults for zsh config, and certain core meta-commands for amethyst. This MUST be sourced,
# and it must be sourced prior to any other amethyst modules.
source "$AMETHYST_LOCATION/modules/core.zsh"
# The alias module contains the aliases that add to builtin commands (like ls -> `ls --color`)
source "$AMETHYST_LOCATION/modules/aliases.zsh"
# The plugin manager
source "$AMETHYST_LOCATION/modules/plugin.zsh"
# Not recommended, but it exists for convenience. Replaces any and all other source commands
# Note that this means sacrificing raw flexibility, and you get everything automatically.
# This may or may not be what you want to do.
# source "$AMETYST_LOCATION/modules/everything.zsh"
```

And that's it.

You can see the full list of modules [here](modules/README.md) to decide what to enable. The modules listed here are considered the minimum modules you'd want enabled, and there may or may not be more available.

