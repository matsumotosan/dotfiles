function ls --wraps='exa --icons -F -H --group-directories-first' --description 'alias ls=exa --icons -F -H --group-directories-first'
  exa --icons -F -H --group-directories-first $argv
        
end
