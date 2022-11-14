set number
set tabstop=4
set shiftwidth=4

set mouse=a

"Vim-Plug Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'ycm-core/YouCompleteMe'

call plug#end()

"Airline-Tabline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme = 'bubblegum'
"let g:airline_powerline_fonts = 1
"let g:airline_section_z = airline#section#create(['%3v L:%L'])

"netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_altv = 1
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
set autochdir

"colorscheme murphy

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_hover = ''
nmap <C-@> <plug>(YCMHover)
"nnoremap <C-@> <Plug>YCMHover
nmap <silent> <S-Tab> :tabNext<CR>
