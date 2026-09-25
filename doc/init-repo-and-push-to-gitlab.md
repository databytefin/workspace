# Init Repo and Push to GitLab

This short guide walks you through creating a local Git repository, making the first commit, creating an empty repository on GitLab, and pushing your code.

## 1. Create a local project and initialize Git

```bash
mkdir myproject
cd myproject
git init
code .
```

- `mkdir myproject` creates a new project folder.
- `cd myproject` moves into that folder.
- `git init` turns the folder into a Git repository.
- `code .` opens the current folder in Visual Studio Code.

## 2. Add a first file and make the initial commit

```bash
touch README.md
git add .
git commit -m 'initial commit'
```

- `touch README.md` creates an empty README file.
- `git add .` stages all new and changed files in the current directory.
- `git commit -m 'initial commit'` records the staged changes as the initial commit.

## 3. Create a new repository on GitLab

1. Sign in to GitLab.
2. Click **New project/repository**.
3. Enter a project name, for example, `myproject`.
4. Choose the appropriate **Visibility Level**:
   - **Private**
   - **Internal**
   - **Public**

5. Create the project.

> **Note:** Do not initialize the GitLab repository with a README or other files because the local repository already contains the initial commit.

After creating the project, GitLab will show the repository URLs. For example:

```text
git@gitlab.com:username/myproject.git
```

Use the **SSH URL** provided by GitLab.

## 4. Connect the local repository and push

```bash
git branch -M main
git remote add origin git@gitlab.com:username/myproject.git
git push -u origin main
```

- `git branch -M main` renames the current branch to `main`.
- `git remote add origin ...` connects the local repository to the GitLab repository.
- `git push -u origin main` pushes the `main` branch to GitLab and sets it as the upstream branch.

Replace:

```text
git@gitlab.com:username/myproject.git
```

with the SSH URL provided by GitLab.

## 5. Verify the repository

After a successful push, refresh the GitLab project page.

You should see:

- `README.md`
- The `main` branch
- The `initial commit`

The local Git repository is now connected to GitLab and ready for future commits and pushes.
