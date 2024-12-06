## Confirm Git Credentials and Remote Repository

# List all configured Git settings (username, email, etc.)
git config --list

# Verify the remote repository URLs
git remote -v

# Update the remote repository URL (if necessary)
git remote set-url origin https://github.com/main-repo.git

## Work With Branches

# List all local branches
git branch

# Switch to an existing branch
git checkout your-branch-name

# Stage and Commit Changes

# Add all changes in the working directory to staging
git add .

# Add specific file(s) to staging
git add path/to/file

# Commit the staged changes with a descriptive message
git commit -m "Your commit message"

## Push Changes to Remote

# Push the current branch to the remote repository
git push origin your-branch-name

# Output confirms the branch is pushed and suggests creating a pull request
# Example: * [new branch] my-feature-branch -> my-feature-branch
# Example: remote: Create a pull request for 'my-feature-branch' on GitHub by visiting:
# remote: https://github.com/username/repo/pull/new/my-feature-branch

## Switch Back to Main Branch

# Switch to the main branch
git checkout main

# -d (safe delete) Delete the feature branch locally after it has been merged
git branch -d my-feature-branch

# -D (force delete): Use this if the branch has not been merged or if you are certain you no longer need it.
git branch -D my-feature-branch

## Update Local Main Branch

# Ensure your local main branch is up-to-date with the remote
git checkout main
git pull origin main

## Start a New Feature

# Create a new branch for the next feature
git checkout -b new-feature-branch
