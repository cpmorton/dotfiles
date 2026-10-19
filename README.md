# dotfiles

The per-user half of my daily driver: only what must live in a home *and* is
personal. Everything else was moved into the OS image,
[`daily-driver-os`](https://github.com/cpmorton/daily-driver-os); its decision
record 0004 ("Where software and configuration go") is the rule for what
belongs here.

Nothing to run, usually. When localadmin names this repository for a user (in
the machine defaults, at first boot, or with `ujust homed-user`), the image
applies it at that user's first login and updates it at every login and daily;
see its decision record 0024. By hand, only when a notification asks, or in a
home nobody named a repository for:

    ujust dotfiles [<github-user>]

Applied with nobody at the keyboard, so **every prompt needs a default**
(`promptStringOnce . "key" "question" "default"`), and scripts that need a
terminal check for one and skip without it.

## What's here, and where it came from

| File | Becomes | Why it isn't in the image |
| --- | --- | --- |
| `.chezmoi.toml.tmpl` | `~/.config/chezmoi/chezmoi.toml` | Name and email, once per machine: unattended, your account's full name and GitHub's no-reply address. Holds the `secrets` switch |
| `dot_gitconfig.tmpl` | `~/.gitconfig` | Your name and email are personal. Git's defaults and the gh credential helper are system-wide in the image's `/etc/gitconfig` |
| `run_after_20-github-auth.sh` | nothing on disk | `gh auth login` stores a token in your keyring: a secret, per user. Runs on every apply, so the sign-in waits for one with a terminal |

## Moved out of this repository

- VS Code's `settings.json` for podman: replaced by the image's
  `podman-docker`, `docker-compose` link and `DOCKER_HOST`, which work for
  every account with no settings.
- Git `init.defaultBranch`, `pull.rebase` and the gh credential helper: now
  in the image's `/etc/gitconfig`.

**This repository is public.** No secrets, tokens or keys, ever. Secret values
will come from a password manager through templates; `secrets` in
`.chezmoi.toml.tmpl` is where that gets switched on.
