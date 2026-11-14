# Contribution guidelines

## Basic guidelines

### Use of generative AI is banned

Generative AI uses training data [based on plagiarism and piracy](https://web.archive.org/web/20250000000000*/https://www.theatlantic.com/technology/archive/2025/03/libgen-meta-openai/682093/), has [significant environmental costs associated with it](https://doi.org/10.21428/e4baedd9.9070dfe7), and [generates fundamentally insecure code](https://doi.org/10.1007/s10664-024-10590-1). GenAI is not ethically built, ethical to use, nor safe to use for programming applications. When caught, you will be permanently banned from contributing to the project, and any prior contributions will be checked and potentially reverted. Any and all contributions you've made cannot be trusted if AI slop machines were involved.

## Adding features

Before adding a completely new module, please open an issue first. If you want to add a feature to an existing module, you should do the same if you plan to make a large addition.

### Out-of-scope features

Anything on this list will be rejected outright.

#### Aliases and themes

With the exception of aliases extending very common commands with extra functionality (like `ls` being aliased to `ls --color`), aliases are not included. Neither are themes.

Both of these are highly opinionated, so there's a lot of them. With aliases in particular, at least for my use, I find that I don't use them unless I write them to cover a specific use-case I have. There shouldn't be hundreds of aliases and hundreds of themes embedded in the core project when most people are only going to stick to one, or a couple at most. With themes in particular, this also prevents problems when the quite possibly [most popular zsh theme](https://github.com/romkatv/powerlevel10k) ends up not being bundled due to the [crushing maintainer load of maintaining hundreds of themes](https://github.com/ohmyzsh/ohmyzsh/issues/7654#issuecomment-475742891).

Both convenience aliases and themes are likely to become a problem if this project ever takes off (which I doubt it will, largely because I don't like ads, so I don't plan to advertise its existence), so it's better to avoid them.

Instead, control is released to whoever wants it through the existence of a plugin manager. This technically requires more lines of code in the config, but it also means individual parts can be replaced much more easily than having to rewrite an entire monolithic core.

