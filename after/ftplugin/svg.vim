setlocal autowrite

" use <leader>v to pre(v)iew markdown files in marked app.
" nnoremap <buffer> <leader>v :MarkedOpen<cr>
nnoremap <leader>v :!open -a Typora.app %<cr>
