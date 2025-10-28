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
