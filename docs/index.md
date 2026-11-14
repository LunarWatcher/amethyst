---
{
    "title": "Documentation for Amethyst"
}
---
# Amethyst

A semi-opinionated, minimal, AI slop-free, and modular zsh config distribution. Serves as a replacement for a chunk of ohmyzsh, now that they've turned to AI slop.

## Features

### Defaults

The main feature of amethyst is the defaults. Zsh has a lot of cool features that, unfortunately, are disabled by default, and this distribution turns them on.

This primarily extends to some common sense/QOL defaults, and not much beyond that. If you need something amethyst doesn't turn on, just add it to your own zshrc.

### Plugin manager

There are already plenty of plugin managers for zsh, but I'm reinventing the wheel because [a lot of them are overcomplicated abandonware](https://github.com/mattmc3/zsh_unplugged?tab=readme-ov-file#electric_plug-zsh-plugin-managers). Amethyst bundles a bare minimum plugin manager.

It exclusively supports Git-based plugins. Unlike many other plugins, there's no default assumption that GitHub is the source of said plugins. A full URL has to be provided, which also makes it more easily compatible with private plugins, self-hosted versions of plugins, or self-hosted secret config as plugins without restricting what can be uploaded. It automatically installs any plugins you are missing, and gives a command for updating plugins, and that's it. You can read more about it in [its documentation](modules/Plugin module.md)

## Performance

Performance is not currently prioritised, but performance is primarily a function of how much crap you end up loading in your config. Because amethyst is minimal, the performance impact from the core loading is negligible. The major overhead comes from sourcing third-party plugins, and for now, a solution to that is not prioritised.

If you load enough stuff that it becomes a problem, you could consider using [romkatv/zsh-defer](https://github.com/romkatv/zsh-defer); unfortunately, it's licensed under GPL, and I have never had enough of a problem with performance to warrant spending a bunch of time reinventing that wheel. You could also consider adding less bloat to your terminal.

On my machine, it boots fast enough that I don't notice any slowness.

## Interacting with amethyst

Use the `amethyst` command. There's very few commands available in it, since there's very little interactive stuff in amethyst that needs runtime commands.

