# Confirm Git Credentials and Remote Repository

## List all configured Git settings (e.g., username, email)
`git config --list`

## Verify the remote repository URLs
`git remote -v`

## Update the remote repository URL (if necessary)
`git remote set-url origin https://github.com/main-repo.git`

---

# Pull the Latest Changes from the Remote Repository
`git pull origin main`

# Work With Branches

## List all local branches
`git branch`

## Switch to an existing branch
`git checkout your-branch-name`

---

# Stage and Commit Changes

## Add all changes in the working directory to staging
`git add .`

## Add specific file(s) to staging
`git add path/to/file`

## Commit the staged changes with a descriptive message
`git commit -m "Your commit message"`

---

# Push Changes to Remote

## Push the current branch to the remote repository
`git push origin your-branch-name`

### Example Output:
- `[new branch] my-feature-branch -> my-feature-branch`
- `remote: Create a pull request for 'my-feature-branch' on GitHub by visiting:`
  `remote: https://github.com/username/repo/pull/new/my-feature-branch`

---

# Switch Back to Main Branch

## Switch to the main branch
`git checkout main`

## Delete the feature branch locally:
- Safe delete (only if merged): `git branch -d my-feature-branch`
- Force delete (unmerged or no longer needed): `git branch -D my-feature-branch`

---

# Update Local Main Branch

## Ensure your local main branch is up-to-date with the remote
`git checkout main`
`git pull origin main`

---

# Start a New Feature

## Create a new branch for the next feature
`git checkout -b new-feature-branch`
