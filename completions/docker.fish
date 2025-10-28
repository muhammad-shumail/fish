# Minimal Docker completions: common subcommands and image suggestions for `docker run`

complete -c docker -n '__fish_use_subcommand' -a 'build run ps images pull push rm rmi exec logs-compose' -d 'subcommand'

# Suggest image names when using `docker run`
complete -c docker -n '__fish_seen_subcommand_from run' -a "(docker image ls --format '{{.Repository}}:{{.Tag}}' 2>/dev/null)" -d 'image'
