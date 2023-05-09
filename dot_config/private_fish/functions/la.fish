function la --wraps=ls --wraps='exa -l -a --icons -F -H --group-directories-first --git' --wraps='exa -la --icons -F -H --group-directories-first --git' --description 'alias la=exa -la --icons -F -H --group-directories-first --git'
  exa -la --icons -F -H --group-directories-first --git $argv
        
end
