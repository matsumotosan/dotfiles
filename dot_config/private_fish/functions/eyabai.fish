function eyabai --wraps='chezmoi edit ~/.config/yabai' --wraps='nvim ~/.config/yabai/yabairc' --description 'alias eyabai=nvim ~/.config/yabai/yabairc'
  nvim ~/.config/yabai/yabairc $argv
        
end
