# Minimal kubectl completions: common subcommands and pod suggestions

complete -c kubectl -n '__fish_use_subcommand' -a 'get describe apply delete create logs exec config port-forward top' -d 'subcommand'

# Suggest pod names for commands that commonly take a pod
complete -c kubectl -n '__fish_seen_subcommand_from get describe exec logs port-forward top' -a "(kubectl get pods --no-headers -o custom-columns=':metadata.name' 2>/dev/null)" -d 'pod'
