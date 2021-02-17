let g:ft = ''
function! myspacevim#before() abort
    " deoplete
    " {{{
    let g:deoplete#ignore_sources = {}
    let g:deoplete#ignore_sources._ = ['buffer', 'around']
    " }}}


    set virtualedit=onemore             " Allow for cursor beyond last character
    set splitright
    set autochdir

    " open a NERDTree automatically when vim starts up if no files were specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " }}}


    let g:neoformat_javascript_jsbeautify = {
        \ 'exe': 'js-beautify',
        \ 'stdin': 1,
        \ }
    let g:neoformat_typescript_prettier = {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'typescript'],
        \ 'stdin': 1
        \ }
    let g:neoformat_enabled_typescript = ['tsfmt', 'prettier']


    " show all uncompliable symbols
    set listchars=tab:>-,trail:~,extends:>,precedes:<
    set list


    " javascript
    let g:tern#command = ["tern"]
    let g:tern#arguments = ["--persistent"]


    " typescript
    let g:tagbar_type_typescript = {
        \ 'ctagstype': 'typescript',
        \ 'kinds': [
          \ 'c:classes',
          \ 'n:modules',
          \ 'f:functions',
          \ 'v:variables',
          \ 'v:varlambdas',
          \ 'm:members',
          \ 'i:interfaces',
          \ 'e:enums',
          \ 's:statics',
        \ ]
    \ }


    " disable ctags
    let g:gutentags_ctags_exclude = [ "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*", "out" ]

    autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
    let g:vue_pre_processors = ['pug', 'scss']

    let g:vim_vue_plugin_load_full_syntax = 1
    if &ft == 'vue'
      let g:ft = 'vue'
      let stack = synstack(line('.'), col('.'))
      if len(stack) > 0
        let syn = synIDattr((stack)[0], 'name')
        if len(syn) > 0
          exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
        endif
      endif
    endif
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
    if g:ft == 'vue'
      setf vue
      let g:ft = ''
    endif

    " WSL yank support
    let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
endfunction

function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction
