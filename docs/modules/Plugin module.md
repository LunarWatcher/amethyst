---
{
    "title": "Plugin module",
    "summary": "Smol package installer and updater for zsh plugins and themes"
}
---
# Plugin module

```zsh
source "$AMETHYST_LOCATION/modules/plugin.zsh"
```

## Description

The plugin module is a light-weight package installer and updater. You declare your plugins in your zshrc, and amethyst makes them available and provides a utility command for updating.

The plugin module is not a full package manager; it lacks removal and version management features by design, as these are overkill for a lot of use-cases.

## Usage

The module uses the `amethyst-plugin` command to declare plugins:

```none
Usage:
  amethyst-plugin theme|auto|manual 'URL to a git repo' [Output variable; only used by manual mode]
Examples:
  amethyst-plugin theme 'https://github.com/romkatv/powerlevel10k'
  amethyst-plugin manual 'https://github.com/romkatv/powerlevel10k' POWERLEVEL_10K_LOCATION
  amethyst-plugin auto 'https://github.com/zsh-users/zsh-syntax-highlighting'

Modes:
  auto: Looks for a <repo-name>.plugin.zsh file
  theme: looks for a <repo-name>.zsh-theme
  manual: Only makes sure the repo exists. Sourcing needs to be done manually
          In this form, the command takes an extra argument that specifies where
          to store the path. Use this if you don't know what to use.
```

## Examples

```zsh
# Auto looks for `repo-name.plugin.zsh`, as is the standard in the anti* zsh package managers, as well as several others
amethyst-plugin auto 'https://github.com/zsh-users/zsh-syntax-highlighting'
# This can also be an SSH url, assuming you have ssh certs set up
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

## Commands

The plugin module exposes the `amethyst plugin` command. The available subcommands are:

* `help`: self-explanatory
* `update`: Updates all plugins by iterating the plugin and running `git pull`
