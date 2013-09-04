" ============================================================================
" Filename: .vimrc
"   Author: Daniel R. Driver
"      URL: http://github.com/danieldriver/dotfiles
" Contents:
"   1. General ............ General Vim settings
"   2. Events ............. Mostly autocmd events
"   3. Display Prefs ...... Color scheme, font, etc.
"   4. User Interface ..... Vim UI behavior
"   5. Text Formatting .... Text, tab, indentation related
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

" expand tabs: vimcasts.org/episodes/tabs-and-spaces/
set expandtab             " insert spaces for tabs
set ts=4 sts=4 sw=4       " use 4 spaces for tab stops
if has("autocmd")         " customize tab stops by file type
    au FileType tex setlocal ts=2 sts=2 sw=2
    au FileType css setlocal ts=2 sts=2 sw=2
    au FileType html setlocal ts=2 sts=2 sw=2
    au FileType yaml setlocal ts=2 sts=2 sw=2
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

" set a readable font and point size
set guifont=Source\ Code\ Pro:h12

" ============================================================================
" 4. User Interface
" ============================================================================
set number                " show line numbers
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set showmatch
set statusline=%<%f\%h%m%r%=%-20.(line=%l\ \ col=%c%V\ \ totlin=%L%)\ \ \%h%m%r%=%-40(bytval=0x%B,%n%Y%)\%P

set sidescroll=5

"============= Search ===============
set ignorecase smartcase
set incsearch hlsearch
" Clear highlighting by hitting return
nnoremap <CR> :noh<CR>

" enforce good habits at the keyboard
no <up> ddkP              " move a line up with the up arrow key
no <down> ddp             " move a line down with the down arrow key
no <left> <Nop>           " unmap the remaining arrow keys
no <right> <Nop>
ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

" ============================================================================
" 5. Text Formatting
" ============================================================================
set wrap linebreak nolist fo+=t
" Toggle wrapping with `Nowrap`, `Wrap` and `Hard`
command! -nargs=* Nowrap set nowrap tw=0 fo-=a go+=b
command! -nargs=* Wrap set wrap linebreak nolist tw=0 fo-=a go-=b
command! -nargs=* Hard set nowrap tw=72 fo+=a go-=b

set autoindent            " auto-indent
" Spelling region
set spelllang=en_ca
" Toggle spell checking
nmap <silent> <leader>s :set spell!<CR>

set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
