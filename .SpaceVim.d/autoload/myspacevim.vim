function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
    set clipboard=unnamed 

    noremap <Tab> :NERDTreeToggle<CR>
    map <S-h> gT
    map <S-l> gt
endfunction
