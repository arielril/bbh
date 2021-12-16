alias pip-upgrade="pip list -o --format freeze | rg -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"
alias aws-login="docker run --rm -it -v ~/.aws:/root/.aws sportradar/aws-azure-login:latest"

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/home/hacker/go/bin" $fish_user_paths



