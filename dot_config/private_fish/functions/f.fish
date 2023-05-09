function f --wraps='fzf --preview="less {}" --bind ctrl-k:preview-page-up,ctrl-j:preview-page-down' --wraps='vim $(fzf --preview="less {}" --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down)' --description 'alias f=vim $(fzf --preview="less {}" --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down)'
  vim $(fzf --preview="less {}" --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down) $argv
        
end
