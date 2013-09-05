" ============================================================================
" Filename: .vimrc
"   Author: Daniel R. Driver
"      URL: http://github.com/danieldriver/dotfiles
" Contents:
"   1. General ............ General Vim settings
"   2. Events ............. Mostly autocmd events
"   3. Display Prefs ...... Color scheme, font, etc.
"   4. User Interface ..... Vim UI settings & behavior
"   5. Text Formatting .... Text, tab, indentation & spelling
" ============================================================================

" ============================================================================
" 1. General
" ============================================================================
set nocompatible          " do not limit Vim to make it Vi-compatible
set encoding=utf-8        " ensure character encoding is utf-8

" ============================================================================
" 2. Events
" ============================================================================
filetype plugin indent on " filetype-detection-on, -plugin-on, -indent-on

" customize tabstop width and expandtab setting by file type
if has("autocmd")
    au FileType tex setlocal ts=2 sts=2 sw=2 et
    au FileType css setlocal ts=2 sts=2 sw=2 et
    au FileType html setlocal ts=2 sts=2 sw=2 et
    au FileType yaml setlocal ts=2 sts=2 sw=2 et
endif

" strip trailing spaces: vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingSpaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" execute manually with <F8>, or on write for specified file extensions
nnoremap <F8> :call <SID>StripTrailingSpaces()<CR>
if has("autocmd")
    au BufWritePre *.tex,*.css,*.html :call <SID>StripTrailingSpaces()
endif

" ============================================================================
" 3. Display Prefs
" ============================================================================
syntax enable             " enable syntax highlighting

colorscheme solarized     " set colorscheme
if has('gui_running')     " use solarized light in GUI, dark in terminal
    set background=light
    highlight colorcolumn ctermbg=lightgrey guibg=#eee8d5
else
    set background=dark
    highlight colorcolumn ctermbg=darkgrey guibg=#073642
endif
let &colorcolumn="80,".join(range(120,320),",") " colorize overlong lines

" define how hidden characters are shown
set listchars+=tab:▸\ ,trail:◆,eol:¬,extends:>,precedes:<
" set a hierarchy of readable fonts (the first valid match is used)
set guifont=Source\ Code\ Pro:h12,Menlo:h12

" ============================================================================
" 4. User Interface
" ============================================================================
set number                " show line numbers
set cursorline            " highlight current line
set nohlsearch            " suppress highlighting of last search results
set incsearch             " but do highlight while typing a search command
set ignorecase            " make searches case-insensitive
set smartcase             " unless the search contains Uppercase Chars
let loaded_matchparen=1   " do not highlight matching brackets
set showmatch             " but jump to a matching bracket once when inserted
set ruler                 " show cursor position and relative page position
set laststatus=2          " last window always has a statusline
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

" remap the arrow keys to shift lines and enforce good keyboarding habits
no <up> ddkP
no <down> ddp
no <left> <Nop>
no <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

" ============================================================================
" 5. Text Formatting
" ============================================================================
set tabstop=4             " set the default tabstop to 4 instead of 8
set softtabstop=4         " unify: vimcasts.org/episodes/tabs-and-spaces/
set shiftwidth=4          " indent by 4 columns as well (with > and <)
set autoindent            " copy current indent on new lines
set expandtab             " use spaces instead of tabs

" wrap text as appropriate: vimcasts.org/episodes/soft-wrapping-text/
set wrap linebreak nolist " start by soft wrapping text
" and toggle wrapping sets on the fly with: `Nowrap`, `Wrap` and `Hard`
command! -nargs=* Nowrap set nowrap tw=0 go+=b
command! -nargs=* Wrap set wrap linebreak nolist tw=0 go-=b
command! -nargs=* Hard set nowrap tw=72 go-=b
set listchars+=extends:>,precedes:< " show overlong lines in nowrap mode
set sidescroll=5          " and pad horizontal scrolling

" toggle spell checking
nmap <silent> <leader>s :set spell!<CR>
set spelllang=en_ca       " set spelling region
