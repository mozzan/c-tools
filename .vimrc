set number
set nocompatible
set backspace=2
set autoindent
syntax on

" TagList
map <f9> :Tlist<CR>
let Tlist_Use_Right_Window = 1

set tags=./tags;
autocmd BufWritePre * :%s/\s\+$//e

let _curfile = expand("%:t")
if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
set noexpandtab
else
set expandtab
set tabstop=4
set shiftwidth=4
endif

" focus current line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" split navigation
map <C-k> <C-W>j
map <C-i> <C-W>k
map <C-j> <C-W>h
map <C-l> <C-W>l

:set background=dark
"show file path
map f :echo @%<CR>
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

" cscope "
cs add cscope.out
"map f :cs find f
"map c :cs find c
"map s :cs find s
nmap <C-h> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-v> :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-i> :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-d> :cs find d <C-R>=expand("<cword>")<CR><CR>
"nmap <C-r> :cs reset<CR>
" nnoremap <C-]> :tabnew %<CR>g<C-]>

" NerdTree
autocmd BufWinEnter * NERDTreeMirror
au VimEnter *  NERDTree
autocmd VimEnter * NERDTree | wincmd p
nnoremap <silent> <F6> :NERDTree<CR>


nnoremap 1 1gt
nnoremap 2 2gt
nnoremap 3 3gt
nnoremap 4 4gt
nnoremap 5 5gt
nnoremap 6 6gt
nnoremap 7 7gt
nnoremap 8 8gt
nnoremap 9 9gt
"nnoremap 10 10gt

map r :1,$s///g
map <f2> :w \| make
" End /etc/vimrc



" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction
