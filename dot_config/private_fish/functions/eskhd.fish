function eskhd --wraps='chezmoi edit ~/.config/skhd' --wraps='nvim ~/.config/skhd/skhdrc' --description 'alias eskhd=nvim ~/.config/skhd/skhdrc'
  nvim ~/.config/skhd/skhdrc $argv
        
end
