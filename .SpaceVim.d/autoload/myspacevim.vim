function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
    set clipboard=unnamed 

    map <Space>gb :Gblame<CR>
    noremap <Tab> :NERDTreeToggle<CR>
    map <S-h> gT
    map <S-l> gt

    let g:NERDTreeShowHidden=1
endfunction
