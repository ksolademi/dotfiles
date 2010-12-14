function! s:MyFind ()
    let found = eclim#python#django#find#ContextFind()
    if !found
        PythonFindDefinition
    endif
endfunction
nnoremap <silent> <buffer> <cr> :call <SID>MyFind()<cr>
