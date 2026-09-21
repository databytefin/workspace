# Git Identity and GitLab SSH Setup

A short checklist for configuring your global Git identity, creating an Ed25519 SSH key, adding the public key to GitLab, and testing the SSH connection.

## 1. Set your global Git identity

Run these commands once on the machine you use for Git:

```bash
git config --global user.name "databytefin"
git config --global user.email "databytefin@gmail.com"
```

Verify the settings:

```bash
git config --global user.name
git config --global user.email
```

* `user.name` is the name recorded in your Git commits.
* `user.email` is the email recorded in your Git commits. Use an email address that is verified and available for commit attribution in your GitLab account.
* `--global` applies these settings to all repositories for the current user.

> **Note:** You can override the global identity for a specific repository by running the same commands without `--global`.

---

## 2. Generate an Ed25519 SSH key

Generate a new SSH key:

```bash
ssh-keygen -t ed25519 -C "databytefin@gmail.com"
```

| Option                       | Meaning                                        |
| ---------------------------- | ---------------------------------------------- |
| `-t ed25519`                 | Uses the Ed25519 SSH key algorithm.            |
| `-C "databytefin@gmail.com"` | Adds a comment to the key to help identify it. |

### File location

When prompted for the file path, press **Enter** to use the default location:

* Private key: `~/.ssh/id_ed25519`
* Public key: `~/.ssh/id_ed25519.pub`

### Passphrase

You can set a passphrase to protect the private key.

* **Recommended:** Set a passphrase, especially on a shared or portable machine.
* Leave it empty if you understand the security trade-off and do not want to enter a passphrase.

> **Important:** Never share `id_ed25519` or upload it to GitLab, GitHub, or a Git repository. Only the `.pub` file should be uploaded to GitLab.

---

## 3. Confirm the key files exist

Run:

```bash
ls -l ~/.ssh/id_ed25519 ~/.ssh/id_ed25519.pub
```

You should see both files:

```text
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

The private key must remain on your machine.

---

## 4. Add the public key to GitLab

Display the public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Copy the entire line, which should look similar to:

```text
ssh-ed25519 AAAA... databytefin@gmail.com
```

Then:

1. Sign in to GitLab.
2. Open **Preferences / User Settings → SSH Keys**.
3. Paste the full contents of `id_ed25519.pub`.
4. Give the key a descriptive title, such as `work-pc`.
5. Save the key.

> **Important:** Only add the public key (`id_ed25519.pub`) to GitLab.

---

## 5. Test the SSH connection

For GitLab.com, run:

```bash
ssh -T git@gitlab.com
```

For a self-hosted or company GitLab instance, replace `gitlab.com` with the appropriate GitLab hostname:

```bash
ssh -T git@gitlab.example.com
```

On the first connection, SSH may ask you to verify the server's host key fingerprint. Verify the fingerprint through a trusted source before accepting it.

If the SSH key is configured correctly, GitLab should return a successful authentication message. GitLab does not provide an interactive shell over SSH, so a message indicating that shell access is unavailable can still be expected.
