" ~/.config/nvim/ftdetect/skript.vim

augroup filetypedetect
  au! BufRead,BufNewFile *.sk set filetype=skript
augroup END

