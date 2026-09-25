# dotfiles

The per-user half of my daily driver: only what must live in a home *and* is
personal. Everything else was moved into the OS image,
[`daily-driver-os`](https://github.com/cpmorton/daily-driver-os); its decision
record 0004 ("Where software and configuration go") is the rule for what
belongs here.

    ujust dotfiles <github-user>    # first time, in each fresh home
    chezmoi update                  # afterwards

## What's here, and where it came from

| File | Becomes | Why it isn't in the image |
| --- | --- | --- |
| `.chezmoi.toml.tmpl` | `~/.config/chezmoi/chezmoi.toml` | Asks for name and email once per machine; holds the `secrets` switch |
| `dot_gitconfig.tmpl` | `~/.gitconfig` | Your name and email are personal. Git's defaults and the gh credential helper are system-wide in the image's `/etc/gitconfig` |
| `run_once_after_20-github-auth.sh` | nothing on disk | `gh auth login` stores a token in your keyring: a secret, per user |

## Moved out of this repository

- VS Code's `settings.json` for podman: replaced by the image's
  `podman-docker`, `docker-compose` link and `DOCKER_HOST`, which work for
  every account with no settings.
- Git `init.defaultBranch`, `pull.rebase` and the gh credential helper: now
  in the image's `/etc/gitconfig`.

**This repository is public.** No secrets, tokens or keys, ever. Secret values
will come from a password manager through templates; `secrets` in
`.chezmoi.toml.tmpl` is where that gets switched on.
