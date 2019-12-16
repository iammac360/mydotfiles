function! myspacevim#before() abort
endfunction

function! myspacevim#after() abort
    set clipboard=unnamed 
    set nofoldenable

    map <Space>gb :Gblame<CR>
    noremap <Tab> :NERDTreeToggle<CR>
    map <S-h> gT
    map <S-l> gt

    let g:dart_html_in_string=v:true
    let g:dart_style_guide = 2
    let g:dart_format_on_save = 1
    let g:NERDTreeShowHidden=1
    let g:NERDTreeWinPos = "left"
endfunction
