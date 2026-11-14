---
{
    "title": "Core module",
    "summary": "The core module with the standard zsh config, and amethyst meta commands"
}
---
# Core module

```zsh
source "$AMETHYST_LOCATION/modules/core.zsh"
```

The core module contains all of the default zsh config. Regardless of what modules you use, this module should be enabled. It's also required for the `amethyst` shell command, that provides utils for updating amethyst, and allows certain modules to have working utility commands.

## Interactive features

### Builtin shortcuts

For the most part, amethyst avoids trying to define default shortcuts. There are going to be exceptions to this as a requirement of enabling default functionality. These are listed here.

* `<C-x><C-e>`: used for interacting with the `edit-command-line` zsh module. This pops up your `$EDITOR` to write commands.

Note: This list does not include "standard" shortcuts that you would expect from any editor. For exmaple, keys similar to ctrl-right (maps to `forward-word`) are not listed here as it's redundant noise.

### The `amethyst` command

Supported subcommands:

* `help`: self-explanatory
* `update`: Updates amethyst.
* `plugin`: Interactive functionality for the plugin module. Only functional if the plugin module is installed. See the [plugin module's command docs](Plugin module.md#commands) for available subcommands

