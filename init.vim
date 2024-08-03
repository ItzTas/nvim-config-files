let g:neoformat_try_node_exe = 1
autocmd FileType javascript setlocal formatprg=prettier\ --semi\ --single-quote\ --trailing-comma\ es5
" Use formatprg when available
let g:neoformat_try_formatprg = 1
