return {
    "goolord/alpha-nvim",
    lazy = false,
    opts = function()
local dashboard = require("alpha.themes.dashboard")
        local logo = [[
	                                    
	    ███    ██ ██    ██ ██ ███    ███
	    ████   ██ ██    ██ ██ ████  ████
	    ██ ██  ██ ██    ██ ██ ██ ████ ██
	    ██  ██ ██  ██  ██  ██ ██  ██  ██
	    ██   ████   ████   ██ ██      ██
]]
dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- local function footer()
-- -- NOTE: requires the fortune-mod package to work
-- 	-- local handle = io.popen("fortune")
-- 	-- local fortune = handle:read("*a")
-- 	-- handle:close()
-- 	-- return fortune
-- 	return "id7eeem"
-- end
-- 
-- dashboard.section.footer.val = footer()
-- 
-- dashboard.section.footer.opts.hl = "Type"
-- dashboard.section.header.opts.hl = "Include"
-- dashboard.section.buttons.opts.hl = "Keyword"
-- 
-- dashboard.opts.opts.noautocmd = true
-- -- vim.cmd([[autocmd User AlphaReady echo 'ready']])
-- alpha.setup(dashboard.opts)
        -- set highlight
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end
        dashboard.section.header.opts.hl = "comment"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl = "AlphaFooter"
        dashboard.opts.layout[1].val = 10
        return dashboard
    end,
    config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                local version = "  󰥱 v"
                    .. vim.version().major
                    .. "."
                    .. vim.version().minor
                    .. "."
                    .. vim.version().patch
                local plugins = "⚡ loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                local datetime = os.date("        %a, %d %b          %H:%M")
                local footer = version .. "\t" .. plugins .. "\n \n" .. datetime .. "\n"
                dashboard.section.footer.val = footer
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
