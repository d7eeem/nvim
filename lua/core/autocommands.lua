vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end
  
  augroup _shell_config
    autocmd!
    autocmd BufWritePost aliasesrc.fish !fish -c 'source $HOME/.config/fish/config.fish && notify-send -i ✓ "Sourcing" "Sourcing complete"'
    autocmd BufWritePost bm-files,bm-dirs !shortcuts.sh
  augroup end
  
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end
  
  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end
  
  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end
  
  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
  
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

local recomp = vim.api.nvim_command
recomp("autocmd BufWritePost aliasesrc.fish !fish -c 'source $HOME/.config/fish/config.fish && notify-send -i ✓ \"Sourcing\" \"Sourcing complete\"'")

recomp("autocmd BufWritePost bm-files,bm-dirs !shortcuts.sh")
