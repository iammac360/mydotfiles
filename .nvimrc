let g:python_host_prog="/usr/local/bin/python"
let g:deoplete#enable_at_startup = 1

if filereadable($HOME . "/.vimrc")
  source ~/.vimrc
endif
