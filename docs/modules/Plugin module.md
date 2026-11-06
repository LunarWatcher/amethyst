# Plugin module

```bash
source $AMETHYST_LOCATION/modules/plugin.zsh
```

## Description

The plugin module is a light-weight package installer and updater. You declare your plugins in your zshrc, and amethyst makes them available and provides a utility command for updating.

The plugin module is not a full package manager; it lacks removal and version management features by design, as these are overkill for a lot of use-cases.

## Usage

The module uses the `amethyst-plugin` command to declare plugins:

```
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

### Updating plugins

Updating plugins can be done with `amethyst plugin update`. This updates all the plugins.

## Examples

```bash
# Note: I use version-pinned  forks of the plugins I use to control what changes I do end up getting
amethyst-plugin auto 'https://github.com/LunarWatcher/wd'
amethyst-plugin auto 'https://github.com/LunarWatcher/zsh-syntax-highlighting'
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
amethyst-plugin theme 'https://github.com/LunarWatcher/powerlevel10k'
```

