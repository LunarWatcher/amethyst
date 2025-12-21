# Amethyst

A semi-opinionated, minimal, AI slop-free, and modular zsh config distribution. Serves as a replacement for a chunk of ohmyzsh, now that they've turned to AI slop.

Of all the projects I have started, this is probably the lowest-level one, and aims to provide some guarantees:

* No AI slop: particularly on the shell, AI slop being involved is a massive threat to the individuals running the software, particularly given [the rate at which LLMs generate insecure code](https://doi.org/10.1007/s10664-024-10590-1).
* AI slop is becoming a supply chain threat. One part falling to AI slop should not break everything. This distribution therefore only covers core config, package management, certain utilities, and resources meant to fill in the rest. Themes and plugins are maintained by other people.
* This repo is also hosted on [Codeberg](https://codeberg.org/LunarWatcher/amethyst) for a non-US-owned source.

## Out-of-scope features

### Aliases and themes

With the exception of aliases extending very common commands with extra functionality (like `ls` being aliased to `ls --color`), aliases are not included. Neither are themes.

Both of these are highly opinionated, so there's a lot of them. With aliases in particular, at least for my use, I find that I don't use them unless I write them to cover a specific use-case I have. There shouldn't be hundreds of aliases and hundreds of themes embedded in the core project when most people are only going to stick to one, or a couple at most. With themes in particular, this also prevents problems when the quite possibly [most popular zsh theme](https://github.com/romkatv/powerlevel10k) ends up not being bundled due to the [crushing maintainer load of maintaining hundreds of themes](https://github.com/ohmyzsh/ohmyzsh/issues/7654#issuecomment-475742891).

Both convenience aliases and themes are likely to become a problem if this project ever takes off (which I doubt it will, largely because I don't like ads, so I don't plan to advertise its existence), so it's better to avoid them. 

Instead, control is released to whoever wants it through the existence of a plugin manager. This technically requires more lines of code in the config, but it also means individual parts can be replaced much more easily than having to rewrite an entire monolithic core.



