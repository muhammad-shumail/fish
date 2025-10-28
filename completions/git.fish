# Basic Git completions (dynamic): branches, tags, remotes

# Suggest branches and remote/branches for common subcommands
complete -c git -n '__fish_seen_subcommand_from checkout merge rebase' -a "(git for-each-ref --format='%(refname:short)' refs/heads refs/remotes 2>/dev/null)" -d 'branch or remote/branch'

# Suggest remotes for push/pull/fetch
complete -c git -n '__fish_seen_subcommand_from push pull fetch' -a "(git remote 2>/dev/null)" -d 'remote'

# Suggest tags when checking out
complete -c git -n '__fish_seen_subcommand_from checkout' -a "(git tag 2>/dev/null)" -d 'tag'
