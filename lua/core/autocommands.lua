vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
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
]]

local recomp = vim.api.nvim_command


recomp(
  "autocmd BufWritePost /home/id7eeem/dots/wm/.local/src/dwmblocks/config.h !cd /home/id7eeem/dots/wm/.local/src/dwmblocks; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }"
)

-- recomp("autocmd BufWritePost ~/.wm/dmenu/config.h !cd ~/.wm/dmenu/; sudo make install")
-- recomp("autocmd BufWritePost ~/.wm/st/config.h !cd ~/.wm/st/; sudo make install")

-- source aliases after editing
recomp(
	'autocmd BufWritePost ~/dots/shell/.config/shell/aliasrc !cd ~/.config/zsh/; source .zshrc && notify-send -i "Sourceing" "sourceing complete"'
)
-- When shortcut files are updated, renew bash and ranger configs with new material:
recomp("autocmd BufWritePost bm-files,bm-dirs !shortcuts.sh")

recomp(
	"autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults,.Xresources,.Xdefaults,.xresources,.xdefaults set filetype=xdefaults"
)
recomp(
	"autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults,.Xresources,.Xdefaults,.xresources,.xdefaults !xrdb %"
)
