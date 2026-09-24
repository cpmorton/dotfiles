# dotfiles

The per-user half of my daily driver. The machine half, the OS image, is
[`daily-driver-os`](https://github.com/OWNER/daily-driver-os).

    ujust dotfiles <github-user>    # first time, in each fresh home
    chezmoi update                  # afterwards

| File | Becomes | Notes |
| --- | --- | --- |
| `dot_gitconfig.tmpl` | `~/.gitconfig` | name and email asked once per machine; GitHub credentials via gh |
| `private_dot_config/Code/User/create_settings.json` | VS Code settings | written once, then VS Code owns it |
| `run_once_after_20-github-auth.sh` | nothing | `gh auth login` on first apply, token into the keyring |

**This repository is public.** No secrets, tokens or keys, ever. Secret values
will come from a password manager through templates: see the `secrets` switch
in `.chezmoi.toml.tmpl`.
