set ruler
set nohls
syntax on
set autoindent smartindent
set tabstop=2
set shiftround
set shiftwidth=2
set expandtab
set wildmode=longest,list
set vb
set t_Co=256
set background=dark
set listchars=tab:~~,eol:$
call pathogen#infect()
call pathogen#helptags()
set encoding=utf-8
set backspace=indent,eol,start
set modeline
set modelines=5

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Turn off vim-json's quote concealment
let g:vim_json_syntax_conceal = 0

augroup default
  au FileType python set tabstop=4 shiftwidth=4
  au BufNewFile,BufRead *.tmpl set filetype=sh
  au BufNewFile,BufRead *.pp set filetype=puppet
  au BufNewFile,BufRead *.bats set syntax=sh
  au BufNewFile,BufRead *.ts setlocal filetype=javascript
  au BufNewFile,BufRead *.handlebars setlocal filetype=html
  au BufNewFile,BufRead *.kt,*.kts setlocal filetype=java
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  au BufNewFile,BufRead *.params, setlocal filetype=json
  au BufNewFile,BufRead Jenkinsfile*, setlocal filetype=groovy
augroup END

if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

colors badwolf
hi SpellBad cterm=underline
