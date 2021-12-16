alias pip-upgrade="pip list -o --format freeze | rg -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"
alias aws-login="docker run --rm -it -v ~/.aws:/root/.aws sportradar/aws-azure-login:latest"

set -g pure_color_current_directory $pure_color_info
set -g pure_color_git_branch $pure_color_success
set -g __done_min_cmd_duration 120000
set -U __done_exclude 'git (?!push|pull)'

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

starship init fish | source


