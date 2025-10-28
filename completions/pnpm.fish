# pnpm completions (common subcommands and 'run' scripts if package.json exists)

complete -c pnpm -n '__fish_use_subcommand' -a 'install i add remove update run start test build publish uninstall' -d 'subcommand'

complete -c pnpm -n '__fish_seen_subcommand_from run' -a "(test -f package.json; and node -e 'const s=require("./package.json").scripts||{}; console.log(Object.keys(s).join(" "))')" -d 'script'
