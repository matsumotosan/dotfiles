function pf --wraps='fzf --preview="less {}" --bind ctrl-k:preview-page-up,ctrl-j:preview-page-down' --wraps='vim $(fzf --preview="less {}" --bind ctrl-k:preview-page-up,ctrl-j:preview-page-down)' --wraps='fzf --preview="less {}" --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down' --description 'alias pf=fzf --preview="less {}" --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down'
  fzf --preview="less {}" --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down $argv
        
end
