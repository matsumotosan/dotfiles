function ezell --wraps='chezmoi edit ~/.config/zellij' --wraps='nvim ~/.config/zellij' --wraps='nvim ~/.config/zellij/config.kdl' --description 'alias ezell=nvim ~/.config/zellij/config.kdl'
  nvim ~/.config/zellij/config.kdl $argv
        
end
