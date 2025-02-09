local api = vim.api
local g = vim.g
local opt = vim.opt

local indent = 2

vim.o.formatoptions = "jcroqlnt"
-- vim.o.shortmess = "filnxtToOFWIcC"
opt.breakindent = true
opt.cmdheight = 0
opt.completeopt = "menuone,noselect"
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.joinspaces = false
opt.list = true
-- opt.mouse = "a"
opt.mouse = ""
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 8
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true
opt.shiftwidth = indent
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
-- vim.opt.splitkeep = "screen"
opt.splitright = true
opt.tabstop = indent
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 200
opt.wildmode = "longest:full,full"
opt.cmdheight = 1
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.scrollback = 100000
opt.smarttab = true
opt.laststatus = 3 -- Global statusline
opt.autoindent = true
opt.textwidth = 0

g.airline_powerline_fonts = 1
-- opt.encoding=utf8
g.mapleader = " "
g.maplocalleader = ","
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- go to previous/next line with h,l,left arrow and right arrow when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable nvim intro
opt.shortmess:append "sI"

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

opt.wildignorecase = true
opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"

-- Better search
opt.path:remove "/usr/include"
opt.path:append "**"
-- vim.cmd [[set path=.,,,$PWD/**]] -- Set the path directly

-- Better Netrw, alternatively just use vinegar.vim
-- g.netrw_banner = 0 -- Hide banner
-- g.netrw_browse_split = 4 -- Open in previous window
-- g.netrw_altv = 1 -- Open with right splitting
-- g.netrw_liststyle = 3 -- Tree-style view
-- g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore

-- GUI
opt.guifont = "Fira_Code:h14"

if g.neovide then
  g.neovide_transparency = 0.9
  g.neovide_fullscreen = true
end
