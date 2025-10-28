# ===========================
#  🐟 Optimized Fish Config
# ===========================

# --- Environment Variables ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less
set -U fish_greeting ""

# PATH (deduplicated)
fish_add_path $HOME/.local/bin
fish_add_path $HOME/bin
fish_add_path /usr/local/bin

# --- Starship Prompt ---
# if type -q starship
#     starship init fish | source
# end

# --- FZF Integration ---
if type -q fzf
    set -gx FZF_DEFAULT_OPTS '--height 40% --reverse --border'
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

    # Load FZF keybindings if available
    test -f $HOME/.fzf/shell/key-bindings.fish; and source $HOME/.fzf/shell/key-bindings.fish
end

# --- Navigation Aliases ---
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# --- LS Aliases (with color support) ---
alias ls='ls --color=auto'
alias ll='ls -lhAF --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lhAtr'  # sort by time
alias lz='ls -lhASr'  # sort by size

# --- File Operations ---
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# --- Git Aliases ---
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gl='git pull'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gd='git diff'
alias gds='git diff --staged'
alias glog='git log --oneline --graph --decorate'
alias gst='git stash'
alias gstp='git stash pop'

# --- Docker Aliases ---
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'
alias dex='docker exec -it'
alias dlog='docker logs -f'
alias dprune='docker system prune -af'

# Docker Compose
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f'
alias dcr='docker-compose restart'

# --- Kubernetes Aliases ---
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kl='kubectl logs -f'
alias kex='kubectl exec -it'
alias kctx='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'

# --- System Aliases ---
alias cls='clear'
alias c='clear'
alias h='history'
alias j='jobs -l'
alias ports='netstat -tulanp'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias myip='curl -s ifconfig.me'
alias update='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias search='apt search'

# --- WezTerm Specific ---
alias wt='wezterm'
alias wtls='wezterm list-fonts'

# --- Quick Edit Configs ---
alias fishconfig='$EDITOR ~/.config/fish/config.fish'
alias starshipconfig='$EDITOR ~/.config/starship.toml'
alias wtconfig='$EDITOR ~/.config/wezterm/wezterm.lua'

# --- Directory Shortcuts ---
abbr -a dl 'cd ~/Downloads'
abbr -a doc 'cd ~/Documents'
abbr -a dev 'cd ~/Development'
abbr -a proj 'cd ~/Projects'

# --- Command Abbreviations (auto-expand) ---
abbr -a gti 'git'
abbr -a v 'nvim'
abbr -a vim 'nvim'
abbr -a py 'python3'
abbr -a ipy 'ipython'
abbr -a jn 'jupyter notebook'

# --- Functions ---

# Make directory and cd into it
function mkcd
    mkdir -p $argv; and cd $argv
end

# Extract various archive types
function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z x $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

# Quick backup function
function backup
    cp $argv[1] $argv[1].bak
end

# Find file by name
function ff
    find . -type f -iname "*$argv*"
end

# Find directory by name
function fd
    find . -type d -iname "*$argv*"
end

# Weather function
function weather
    curl -s "wttr.in/$argv?format=3"
end

# --- Safe Key Bindings ---
# These bindings avoid conflicts with system shortcuts

if status --is-interactive
    # Alt+C: cd into selected directory (fzf)
    bind \ec 'cd (fd --type d | fzf); commandline -f repaint'

    # Alt+H: cd to home
    bind \eh 'cd ~; commandline -f repaint'

    # Alt+E: open file in editor (fzf)
    bind \ee '$EDITOR (fzf); commandline -f repaint'

    # Alt+K: kill process (fzf)
    bind \ek 'ps aux | fzf | awk \'{print $2}\' | xargs -r kill; commandline -f repaint'

    # Ctrl+G: Git status
    bind \cg 'git status; commandline -f repaint'

    # Alt+L: List long format
    bind \el 'll; commandline -f repaint'

    # Alt+.: Insert last argument of previous command
    bind \e. 'history-token-search-backward'

    # Ctrl+Alt+E: Edit command in editor
    bind \e\ce 'edit_command_buffer'
end

# --- Performance Optimizations ---
# Cache command paths for faster execution
set -g fish_complete_path $fish_complete_path

# --- Conditional Plugin Loading ---
# Load only if installed to avoid errors

# Z (directory jumper)
if type -q zoxide
    zoxide init fish | source
end

# Autojump alternative
if test -f /usr/share/autojump/autojump.fish
    source /usr/share/autojump/autojump.fish
end

# --- Syntax Highlighting & Autosuggestions ---
# These are typically installed via Fisher/Oh-My-Fish
set -g fish_color_autosuggestion 555 brblack
set -g fish_color_cancel -r
set -g fish_color_command green
set -g fish_color_comment brblack
set -g fish_color_error red
set -g fish_color_param cyan

# --- Interactive Shell Only ---
if status --is-interactive
    # Show system info on startup (optional - uncomment if desired)
    # neofetch
    # pfetch

    # Print a nice greeting
    echo "🐟 Fish Shell Ready | $(date +%H:%M)"
end

# --- Local Overrides ---
# Source local config if it exists (for machine-specific settings)
if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end