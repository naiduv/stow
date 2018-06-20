# stow
Use stow to upload individual files to an existing repo quickly

Usage: ./stow.sh local_file_name ssh_git_repo_url branch_name

Stow creates a clone of the repo in the ~/.stow/tmp directory.
It then copies the local file you wish to push to that directory, commits and pushes it to the branch specified.

**Known Issues**
- Does not pull repo, so if remote changes occur, user needs to manually delete the repo in tmp - work around might be to just 'git reset --hard origin master' after a failure or when the call to stow is made.
- Does not correctly account for new branches

**Still a work in progress**
