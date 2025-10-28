function cdf
    # fzf-based cd: pick a directory interactively (ignores dotdirs)
    set -l dir (command find . -type d -not -path '*/\.*' 2>/dev/null | sed 's|^\./||' | fzf --height 40% --reverse)
    if test -n "$dir"
        cd $dir
    end
end
