# docker-compose completions: common subcommands and service suggestions for run/up

complete -c docker-compose -n '__fish_use_subcommand' -a 'up down build run ps logs exec start stop restart pull push config' -d 'subcommand'

# Suggest services from docker-compose.yml when present
complete -c docker-compose -n '__fish_seen_subcommand_from up run logs exec start stop restart' -a "(test -f docker-compose.yml || test -f docker-compose.yaml; and python -c 'import sys, yaml, json; y=yaml.safe_load(sys.stdin); print(" ".join(y.get("services",{}).keys()))' <(cat docker-compose.yml 2>/dev/null || cat docker-compose.yaml 2>/dev/null) 2>/dev/null)" -d 'service'
