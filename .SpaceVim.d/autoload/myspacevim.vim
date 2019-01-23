function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
    let g:NERDTreeShowHidden=1
    set clipboard=unnamed 

    noremap <Tab> :NERDTreeToggle<CR>
    map <S-h> gT
    map <S-l> gt
endfunction
