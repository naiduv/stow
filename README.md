# stow
Use stow to upload individual files to an existing repo quickly

Usage: ./stow.sh local_file_name ssh_git_repo_url branch_name

Stow creates a clone of the repo in the ~/.stow/tmp directory.
It then copies the local file you wish to push to that directory, commits and pushes it to the branch specified.

**Known Issues**
- Does not pull repo, so if changes occur need to manually delete the repo in tmp

**Still a work in progress**
