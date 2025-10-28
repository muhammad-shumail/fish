Fish config enhancements
=======================

This folder contains a few ergonomic improvements and completions added to your Fish setup.

Files added
- `functions/cdf.fish` — fzf-based interactive directory picker (run `cdf`).
- `functions/_git_branches.fish` — helper that prints git branches and remotes (used by completions).
- `completions/git.fish` — dynamic git completions (branches, tags, remotes).
- `completions/docker.fish` — docker image suggestions for `docker run`.
- `completions/docker-compose.fish` — docker-compose subcommands and optional service suggestions.
- `completions/kubectl.fish` — kubectl subcommands and pod name suggestions.
- `completions/terraform.fish` — terraform common subcommands.
- `completions/npm.fish` & `completions/pnpm.fish` — npm/pnpm common subcommands and `run` script suggestions when `package.json` exists.

How to enable optional integrations
- fzf: If you installed `fzf` in `~/.fzf`, keybindings/completions are sourced automatically. Otherwise, add the appropriate `source` lines to `config.fish`.
- starship: If `starship` is installed it will be initialized automatically.

Notes & troubleshooting
- Some completion features use small helper commands (e.g. `node` to read `package.json` scripts or `python` + PyYAML to parse compose files). If those tools aren't available, the completions will silently fall back to the static lists.
- All helpers are autoloaded from the `functions/` directory. You can edit or remove them independently.

If you'd like more completions or prefer the helpers to be defined inline in `config.fish`, tell me which approach you prefer and which tools to prioritize (kubectl, k9s, helm, gh, az, aws, etc.).
