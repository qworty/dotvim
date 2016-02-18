"Mandatory vimrc for sudodev
" created by Sudodev
" last edit on 
"Thu Dec 19 02:48:12 CET 2013
" Pathogen for uber quick vim plugin installing
call pathogen#infect()
call pathogen#helptags()

set nocompatible "because well it's viM not vi
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%) "nice statusbar config
filetype plugin indent on "speaks for itself
set grepprg=grep\ -nH\ $* "because we love grep with line numbers
let g:tex_flavor = "latex" "well, never used this before, need to LaTeX more
 
syntax on "because all white text kinda sucky, better use notepad.exe
let mapleader = "," 
"standard leader key is \ and , is quicker


"set mouse=a "for faggots who want to use their mouse
"set cursorline "kinda annoying after a while, highlights the current active line

set mousehide "because I dont want to see my mouse hovering
"smart wrapping
"set nowrap "else it messes up my macros when using j
set wrap "but canceling it out because if you want j in macros just use +
set lbr "set wrap no breaking words
set autoindent "pretty usefull standard IDE stuff
set history=1000 "because I LOVE history
set expandtab "please no more tabs, just space it
set shiftwidth=2 "how much space
set tabstop=2 "same shit but different
set softtabstop=2 "same shit but different
set laststatus=2 "Always a statusbar containg filename

" search
set smartcase "when using UPPERcase notice it, else don't bother
set ignorecase "same but different
set hlsearch "highlight my search while doing it
" incsearch is search while typing, shows matches before hitting enter
set incsearch

"/g/testing
"highlight ColorColumn guibg=#220000 "highlights column 80
set colorcolumn=0 "but I didn't like it

"super awesome functions for automatic relative/normal number toggling
function! ToggleRelativeAbsoluteNumber()
if &number
  set relativenumber
else
  set number
endif
endfunction
set relativenumber "set that shit
set number "and that shit

""This became obsolete because above rule, keeping it for legacy reasons
"nmap <F11> :set number!<CR> 
"nmap <F12> :set relativenumber<CR>

"save with sudo
nnoremap <Leader>ww :w !sudo tee % >/dev/null<cr>

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:~

" Showoff shizzle
nnoremap <Leader>r- :t.<cr>:norm 0vg_r-<cr>
"nnoremap <Leader>r= :t.<cr>:norm 0vg_r=<cr>
"rewrote it to see if I could do it better, I did!
nnoremap <Leader>r= Yp0vg_r=

"for use with syntactic plugin for quick saving and showing parse errors
nnoremap <Leader>w :w<cr> :Errors<cr>

"switching line numbers
nnoremap <F11> :call ToggleRelativeAbsoluteNumber()<CR>
"quick reload vimrc when things changes, so ,sv in normal mode
nnoremap <Leader>sv :source $MYVIMRC<cr>

" Change to working directory of current file and echo new location
nnoremap cd :cd %:h<cr>:pwd<cr>

"Not really usefull doesn't work like I expected, should be on an other
"position or something.
"; isn't really that usefull use : more than ; can't bother to tap shift
"nnoremap ; :
"sometimes I would like to use it though
"nnoremap : ;

" K is one of the dumber things in vim
"map K k

" Paste toggle so it disables auto indent
set pastetoggle=<F2>

"Copy paste from system clipboard
nnoremap <Leader>p :r!xsel<CR>
noremap <Leader>y :!tee >(xsel -i)<CR>

" checktime shortcut for reloading when working with git files
noremap <Leader>t :checktime<CR>l<CR>
noremap <Leader>gg :!git commit -a -m "vimcommit";git pull;git push; ssh root@02.sudodev.net 'gitupdate'

" hide buffers instead of closing, can do :e on an unsaved buffer
set hidden

" bind escape to jj in insert mode, easier to type then reach to escape to go
" to normal mode, but don't use it as much because I remapped capslock to escape
inoremap jj <Esc>

" all positions on screen are reachable
set virtualedit=all


"doesn't really work, need to figure this one out again
"if has("automcd")
"  autocmd bufwritepost .vimrc source $MYVIMRC
"endif

"quick editing of vimrc
nmap <Leader>v :vsplit $MYVIMRC<CR>

"disable highlighthing after a search, fucking handy;
nmap <Leader>m :noh<CR>

" arrow keys are the DEVIL
" allow them only for command mode to scroll the history.
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"make focused window bigger
set winheight=5
set winheight=999
set winwidth=84
"set winminheight=5

"OH YES PLEASE MAGIC
set magic

" persistend undo history
"if has('persistent_undo')
set undofile " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=10000 " How many undos
set undoreload=10000 " number of lines to save for undo
"endif

"No more pesky swp files everywhere
set backupdir=~/.vim/temp
set directory=~/.vim/temp

" Nerdtree
"autocmd vimenter * NERDTree
"let NERDTreeShowBookmarks=1
"let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=1
"let NERDTreeMouseMode=2
"let NERDTreeShowHidden=1
"let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
"let NERDTreeKeepTreeInNewTab=1
"let g:nerdtree_tabs_open_on_gui_startup=0

" ctrlp
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"

"because I want to try other colorschemes sometimes, still gardener rocks 
source ~/.vim/bundle/setcolors/setcolors.vim
"I don't want to get headaches
set background=dark
"colorscheme wombat
colo gardener "OH YEA OH YEAAAA

" Always show line numbers, but only in current window.
":au WinEnter * :setlocal relativenumber
":au WinLeave * :setlocal norelativenumber

" Absolute Line Numbers in Insert Mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

"templateloader
autocmd BufNewFile * silent! -r ~/.vim/templates/%e:template

"highlight OverLength ctermbg=lightred ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" ================ Scrolling ========================

set scrolloff=3 "Start scrolling when we're 3 lines away from margins
"set sidescrolloff=15
"set sidescroll=1

" Get rid of the fancy arrows, because your system doesn't support that,
" somehow.
let g:NERDTreeDirArrows=0
" Mocht je ooit airline gaan gebruiken gaan hiermee die gekke symbols weg.
" Airline
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" let g:airline_left_alt_sep = '|'
" let g:airline_right_alt_sep = '|'
" let g:airline_theme='powerlineish'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
"
"
"
"way better than normal behaviour where you just have to guess how many tabs
"it would take till I arrive at the correct file
set wildmenu
" set wildmode=longest:full,list:full "figure out what this does extra
" LOOK INTO SYNTASTIC PLUGIN AND TAGBAR and git-gutter, does plusses and
" minusses whom are not commited yet, uber awesome
" ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
" I DID AND IT ROCKS MY OLD ME!!! IF ONLY YOU KNEW.
"
"Learning autocommand
"autocmd BufRead,BufWritePre *.html,*.xml normal gg=G

"below doesnt work, figure it out dude.
"autocmd Filetype perl nnoremap <leader>r :!%<cr>

"open file under cursor in vsp mode
"super handy because gf just opens it in current buffer, which isn't that
"great if you only want to look at it for references
nnoremap <F8> :vertical wincmd f<CR>

nmap <leader>r viwpyiw
"That's all folks!!
