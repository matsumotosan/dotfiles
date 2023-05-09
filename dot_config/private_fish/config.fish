set -gx EDITOR nvim
set -gx VISUAL nvim

starship init fish | source
zoxide init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/shion/opt/miniconda3/bin/conda
    eval /Users/shion/opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

# abbr
abbr -a gs git status
abbr -a gco git checkout
fish_add_path /Users/shion/.spicetify
