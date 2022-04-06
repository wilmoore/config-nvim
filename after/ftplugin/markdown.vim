setlocal autowrite

" use <leader>v to pre(v)iew markdown files in marked app.
" nnoremap <buffer> <leader>v :MarkedOpen<cr>
nnoremap <leader>v :!open -a Typora.app %<cr>

" use `>` as comment prefix in markdown files.
setlocal commentstring=>\ %s

" todo list item
nnoremap <leader>mt i- [ ]  <esc>

" image 
nnoremap <leader>mi i![]()<esc>i
