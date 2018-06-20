# stow
Use stow to upload individual files to an existing repo quickly

Usage: ./stow.sh local_file_name ssh_git_repo_url branch_name

Stow creates a clone of the repo in the ~/.stow/tmp directory.
It then copies the local file you wish to push to that directory, commits and pushes it to the branch specified.

**Known Issues**
- Fails silently on every step, requires user to look at the logs
- Does not pull repo, so if remote changes occur, user needs to manually delete the repo in tmp - work around might be to just 'git reset --hard origin master' after a failure or when the call to stow is made.
- Does not correctly account for new branches

**Future work**
- perform git pull before adding the new file
- pull branches, create branch if it does not exist
- show friendly errors eg: ssh-key, could not find, already exists
