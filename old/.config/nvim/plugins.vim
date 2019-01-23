" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-sensible'
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'spf13/vim-colors'
Plug 'whatyouhide/vim-gotham'
Plug 'scrooloose/nerdcommenter'
Plug 'bling/vim-airline'
Plug 'Shougo/neocomplete.vim'

" utilities
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer
"Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " fuzzy file finder and so much more
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-commentary' " comment stuff out
Plug 'tpope/vim-unimpaired' " mappings which are simply short normal mode aliases for commonly used ex commands Plug 'tpope/vim-endwise' " automatically add end in ruby
Plug 'tpope/vim-ragtag' " endings for html, xml, etc. - ehances surround
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
Plug 'benmills/vimux' " tmux integration for vim
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'neomake/neomake' " neovim replacement for syntastic using neovim's job control functonality
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'tpope/vim-repeat' " enables repeating other supported plugins with the . command
Plug 'garbas/vim-snipmate' " snippet manager
Plug 'editorconfig/editorconfig-vim' " .editorconfig support
Plug 'MarcWeber/vim-addon-mw-utils' " interpret a file by function and cache file automatically
Plug 'tomtom/tlib_vim' " utility functions for vim
Plug 'sotte/presenting.vim', { 'for': 'markdown' } " a simple tool for presenting slides in vim based on text files
Plug 'tpope/vim-dispatch' " asynchronous build and test dispatcher
Plug 'tpope/vim-vinegar' " netrw helper
Plug 'AndrewRadev/splitjoin.vim' " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
Plug 'vim-scripts/matchit.zip' " extended % matching
Plug 'tpope/vim-sleuth' " detect indent style (tabs vs. spaces)
Plug 'sickill/vim-pasta' " context-aware pasting
Plug 'eagletmt/neco-ghc'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'craigemery/vim-autotag'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vader.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'justincampbell/vim-eighties'
Plug 'mhinz/vim-signify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'mileszs/ack.vim'
Plug 'rstacruz/named-media-queries'
"Plug 'rstacruz/vim-hyperstyle'
Plug 'rstacruz/vim-opinion'
Plug 'rstacruz/vim-closer'
Plug 'rstacruz/vim-remux'
Plug 'scrooloose/syntastic'
Plug 'sjl/vitality.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'zchee/deoplete-jedi'
Plug 'fishbullet/deoplete-ruby'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Denite
Plug 'Shougo/denite.nvim'

" html / templates
Plug 'mattn/emmet-vim', { 'for': 'html' } " emmet support for vim - easily create markdup wth CSS-like syntax
Plug 'gregsexton/MatchTag', { 'for': 'html' } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': 'html' } " html5 support
Plug 'mustache/vim-mustache-handlebars' " mustach support
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] } " pug / jade support

" JavaScript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'moll/vim-node', { 'for': 'javascript' } " node support
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] } " JSX support
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'heavenshell/vim-jsdoc'
Plug 'flowtype/vim-flow', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g flow-bin' }

" TypeScript
Plug 'jason0x43/vim-tss', { 'for': 'typescript', 'do': 'npm install' }
" Plug 'Quramy/tsuquyomi', { 'for': 'typescript', 'do': 'npm install' } " extended typescript support - works as a client for TSServer
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
"Plug 'Quramy/tsuquyomi', { 'for': 'typescript'} 
Plug 'tasn/vim-tsx'

" Elm
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

" CoffeeScript
Plug 'kchmck/vim-coffee-script'

" styles
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support

" markdown
Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support

" ruby
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'

" language-specific plugins
Plug 'elzr/vim-json', { 'for': 'json' } " JSON support
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " interactive command execution in vim
Plug 'fatih/vim-go', { 'for': 'go' } " go support
Plug 'elixir-lang/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'thinca/vim-ref'
Plug 'slashmili/alchemist.vim'
Plug 'vim-scripts/SyntaxRange'
Plug 'StanAngeloff/php.vim'
Plug 'timcharper/textile.vim', { 'for': 'textile' } " textile support
Plug 'exu/pgsql.vim'
Plug 'tfnico/vim-gradle'
Plug 'garyburd/go-explorer'
Plug 'gevans/vim-ginkgo'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'yosssi/vim-ace'
Plug 'cfdrake/vim-carthage'
Plug 'jvirtanen/vim-cocoapods'
Plug 'justincampbell/vim-eighties'
Plug 'xuhdev/indent-java.vim', { 'for': 'java' }
Plug 'keith/swift.vim'
Plug 'eraserhd/vim-ios'
Plug 'Rip-Rip/clang_complete'
Plug 'KurtPreston/vim-autoformat-rails'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'kylef/apiblueprint.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'solarnz/thrift.vim'
Plug 'klen/python-mode'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'yodiaditya/vim-pydjango'
Plug 'digitaltoad/vim-pug'
Plug 'derekwyatt/vim-scala'
Plug 'derekwyatt/vim-scala'
Plug 'ktvoelker/sbt-vim'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'ledger/vim-ledger'
Plug 'jparise/vim-graphql'
Plug 'vim-scripts/Greplace.vim'
Plug 'tomlion/vim-solidity'
Plug 'rmercer93/vimserpent'

call plug#end()

