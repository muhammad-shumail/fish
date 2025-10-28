# npm completions (common subcommands and 'run' scripts if package.json exists)

complete -c npm -n '__fish_use_subcommand' -a 'install i ci run start test build publish uninstall audit ls outdated' -d 'subcommand'

# If package.json exists, offer defined scripts for `npm run`
complete -c npm -n '__fish_seen_subcommand_from run' -a "(test -f package.json; and node -e 'const s=require("./package.json").scripts||{}; console.log(Object.keys(s).join(" "))')" -d 'script'
