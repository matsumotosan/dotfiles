function ll --wraps=ls --wraps='exa -l --icons -F -H --group-directories-first --git' --description 'alias ll=exa -l --icons -F -H --group-directories-first --git'
  exa -l --icons -F -H --group-directories-first --git $argv
        
end
