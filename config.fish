# ---- AUTOSUGGESTIONS + HIGHLIGHTING ----
if functions -q fish_autosuggest_start
    fish_autosuggest_start
end

if functions -q fish_syntax_highlighting
    fish_syntax_highlighting
end

# ---- ENABLE Z (dir jumping) ----
if functions -q z
    function cd
        z $argv
    end
end

if type -q starship
    starship init fish | source
end
set -gx STARSHIP_CONFIG $HOME/.config/starship.toml

# ---- Pro enhancements (safe, reversible) ----
# Disable the interactive greeting for a cleaner startup
set -U fish_greeting ''

# Only run interactive helpers in interactive shells
if status --is-interactive

    # Ensure common user-local bin dirs are early on PATH
    set -gx PATH $HOME/.local/bin $HOME/bin $PATH

    # fzf keybindings and completion (if installed in the home directory)
    if test -f $HOME/.fzf/shell/key-bindings.fish
        source $HOME/.fzf/shell/key-bindings.fish
    end
    if test -f $HOME/.fzf/shell/completion.fish
        source $HOME/.fzf/shell/completion.fish
    end

    # Handy aliases
    alias ll='ls -lah'
    alias la='ls -A'
    alias gst='git status'
    alias gco='git checkout'
    alias gp='git push'
    alias gl='git pull'

    # Note: interactive helpers (cdf, _git_branches) are provided as autoloaded
    # functions in the `functions/` directory for portability and easier testing.

end