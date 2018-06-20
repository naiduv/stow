if [ $# -ne 3 ]; then
    printf "\n Usage: $0 local_file_name git_repo_url branch_name\n"
    exit 1
fi

local_file_name=$1;
git_repo_url=$2;
branch=$3;

stow_dir="~/.stow";
eval "mkdir -p ${stow_dir}";

stow_tmp_dir="~/.stow/tmp";
eval "mkdir -p ${stow_tmp_dir}";

stow_log_dir="~/.stow/tmp/logs";
eval "mkdir -p ${stow_log_dir}";


# clone the repo to ~/tmp
repo_name=`eval echo '${git_repo_url}' | rev | cut -f1 -d '/' | rev | cut -f1 -d'.'`;

repo_dir="${stow_tmp_dir}/${repo_name}";
log_file_name=$(date +%s);
log_path="${stow_log_dir}/${log_file_name}.log";

nohup_log_cmd_suffix=" >> ${log_path} 2>&1";

# clone the repo to tmp
eval "(cd ${stow_tmp_dir} ; git clone ${git_repo_url}) ${nohup_log_cmd_suffix}"

#switch branch
eval "(cd ${repo_dir} ; git checkout ${branch}) ${nohup_log_cmd_suffix}";

#copy local_file_name to the tmp  git repo
eval "nohup cp ${local_file_name} ${repo_dir} ${nohup_log_cmd_suffix}";

#git add --all
eval "(cd ${repo_dir} ; git add --all ; git commit -a -m \"stowed ${local_file_name}\") ${nohup_log_cmd_suffix}"

#push to master
eval "(cd ${repo_dir} ; git push origin ${branch}) ${nohup_log_cmd_suffix}";
