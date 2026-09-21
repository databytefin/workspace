# Common Git Commands

This guide covers common Git commands used in daily development workflows.

## Repository

### Initialize a repository

```bash
git init
```

Creates a new local Git repository.

### Check repository status

```bash
git status
```

Shows the current status of files:

- modified files
- untracked files
- staged files

### Clone a repository

```bash
git clone <repository-url>
```

Copies a remote repository to the local machine.

---

## Configure Git

### Check Git configuration

```bash
git config --list
```

### Set username

```bash
git config --global user.name "your-name"
```

### Set email

```bash
git config --global user.email "your-email@example.com"
```

---

## Add and Commit

### Add changes

```bash
git add .
```

Adds all changes to the staging area.

### Commit changes

```bash
git commit -m "commit message"
```

Creates a commit with a message.

### View commit history

```bash
git log --oneline
```

---

## Branch

### Create and switch branch

```bash
git switch -c <branch-name>
```

### Switch branch

```bash
git switch <branch-name>
```

### List branches

```bash
git branch
```

### Delete branch

```bash
git branch -d <branch-name>
```

---

## Remote Repository

### View remote repositories

```bash
git remote -v
```

### Add remote repository

```bash
git remote add origin <repository-url>
```

### Change remote URL

```bash
git remote set-url origin <repository-url>
```

---

## Push and Pull

### Push changes

```bash
git push
```

### Push branch for the first time

```bash
git push -u origin main
```

### Pull changes

```bash
git pull
```

### Fetch changes

```bash
git fetch
```

---

## Merge

```bash
git merge <branch-name>
```

Merges another branch into the current branch.

---

## View Changes

### View unstaged changes

```bash
git diff
```

### View staged changes

```bash
git diff --staged
```

---

## Undo Changes

### Unstage a file

```bash
git restore --staged <file>
```

### Discard changes

```bash
git restore <file>
```

### Amend latest commit

```bash
git commit --amend
```

---

## Stash

### Save temporary changes

```bash
git stash
```

### Restore stash

```bash
git stash pop
```

### View stash list

```bash
git stash list
```

---

## Tags

### Create tag

```bash
git tag v1.0.0
```

### Push tag

```bash
git push origin v1.0.0
```

---

## Git Workflow Overview

```text
working directory
        |
        | git add
        v
 staging area
        |
        | git commit
        v
 local repository
        |
        | git push
        v
 remote repository
```

---

## Quick Reference

| Command        | Purpose                  |
| -------------- | ------------------------ |
| `git init`     | Create repository        |
| `git clone`    | Clone repository         |
| `git status`   | Check status             |
| `git add`      | Stage changes            |
| `git commit`   | Create commit            |
| `git log`      | View history             |
| `git branch`   | Manage branches          |
| `git switch`   | Switch branches          |
| `git merge`    | Merge branches           |
| `git remote`   | Manage remotes           |
| `git pull`     | Fetch and merge          |
| `git fetch`    | Fetch changes            |
| `git push`     | Push changes             |
| `git diff`     | View differences         |
| `git stash`    | Save temporary changes   |
