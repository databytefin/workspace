# ssh-menu

A small Bash helper that shows a numbered list of SSH targets and connects to the one you pick.

Targets live in a plain-text config file. Add or edit hosts without changing the script.

## Files

| File | Purpose |
| --- | --- |
| `ssh-menu.sh` | Menu script (connects with `ssh`) |
| `ssh-targets.conf` | Your real host list (not committed with secrets if you later add any) |
| `ssh-targets.conf.example` | Template / example list |

Suggested project folder: `~/bin/ssh-menu/` or `~/projects/ssh-menu/`.

## Requirements

- Bash
- `ssh` on your PATH
- Network access to the target hosts
- Working SSH auth (key or password) for each `user@host`

## Install

Copy the script to your machine, for example:

```bash
mkdir -p ~/bin/ssh-menu
cp ssh-menu.sh ssh-targets.conf.example ~/bin/ssh-menu/
chmod +x ~/bin/ssh-menu/ssh-menu.sh
```

Create your real config from the template:

```bash
cp ~/bin/ssh-menu/ssh-targets.conf.example ~/bin/ssh-menu/ssh-targets.conf
vim ~/bin/ssh-menu/ssh-targets.conf
```

## Config format

File: `ssh-targets.conf`

One target per line:

```text
Display name|user@host
```

Rules:

- Separate the label and the SSH destination with a single `|`
- Lines starting with `#` are comments
- Blank lines are ignored
- Do not wrap values in quotes

Example:

```text
# One target per line: Display name|user@host
Office Linux|alice@192.168.1.10
Jump host|bob@bastion.example.com
```

## Run

Default: the script reads `ssh-targets.conf` in the same directory as the script.

```bash
~/bin/ssh-menu/ssh-menu.sh
```

Or from the project directory:

```bash
./ssh-menu.sh
```

You will see a menu like:

```text
========================================
  SSH target menu
  Config: /home/you/bin/ssh-menu/ssh-targets.conf
========================================

  1) Office Linux       alice@192.168.1.10
  2) Jump host          bob@bastion.example.com
  0) Quit

Choose a target [0-2]:
```

Type a number and press Enter.

- `1`–`N` starts `ssh` to that host
- `0` quits the menu

## Leave the remote session

On the remote machine:

- type `exit`, or
- press `Ctrl-D`

That ends SSH and returns you to your local shell.

## Optional: another config path

```bash
SSH_TARGETS_FILE=/path/to/ssh-targets.conf ~/bin/ssh-menu/ssh-menu.sh
```

## Notes

- The script runs `exec ssh user@host`, so after a successful connect the menu process is replaced by SSH.
- If a host needs a non-default key or port, put that in `~/.ssh/config` under a `Host` alias, then use the alias on the right-hand side of the config line.
- Keep `ssh-targets.conf` next to the script unless you set `SSH_TARGETS_FILE`.
