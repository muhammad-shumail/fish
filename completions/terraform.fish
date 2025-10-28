# Minimal Terraform completions: common subcommands

complete -c terraform -n '__fish_use_subcommand' -a 'init plan apply destroy fmt validate providers state workspace import output taint untaint' -d 'subcommand'
