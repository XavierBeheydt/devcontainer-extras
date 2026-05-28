# Dev Container Extras

A collection of [dev container Features](https://containers.dev/implementors/features/) hosted on GitHub Container Registry.

## Features

### `lazyvim`

Installs the [LazyVim](https://www.lazyvim.org/) starter configuration as the default Neovim config (`~/.config/nvim`).  
Skipped automatically if `~/.config/nvim` already exists (e.g. mounted from host).

**Usage in `devcontainer.json`:**

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/xavierbeheydt/devcontainer-extras/lazyvim:0": {}
    }
}
```

**What it does:**

1. Checks whether `~/.config/nvim` already exists — if so, skips installation.
2. Clones the [LazyVim/starter](https://github.com/LazyVim/starter) repository into `~/.config/nvim`.
3. Removes the `.git` folder from the cloned config (so it's not a nested git repo).
4. Sets ownership of the config directory to the remote user.

**Prerequisites:**

This feature depends on Neovim being available. It is recommended to install it via another feature first:

```jsonc
{
    "features": {
        "ghcr.io/duduribeiro/devcontainer-features/neovim:1": {},
        "ghcr.io/xavierbeheydt/devcontainer-extras/lazyvim:0": {}
    }
}
```

The `installsAfter` property in `devcontainer-feature.json` ensures `lazyvim` is installed after `neovim`.

## Repository Structure

```
├── src
│   └── lazyvim
│       ├── devcontainer-feature.json
│       └── install.sh
└── test
    └── lazyvim
        └── test.sh
```

## Publishing

Features are published to GHCR via the [Release workflow](.github/workflows/release.yaml).  
After publishing, mark each GHCR package as **public** to stay within the free tier:

```
https://github.com/users/xavierbeheydt/packages/container/devcontainer-extras%2F<featureName>/settings
```

## License

[MIT](LICENSE)
