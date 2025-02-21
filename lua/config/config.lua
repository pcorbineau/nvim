local opt = vim.opt

-- clipboard system
opt.clipboard = "unnamedplus"

-- line number
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

-- ignore case when searching
opt.ignorecase = true -- all searches will be case insensitive
opt.smartcase = true  -- search will be case sensitive if it contains an uppercase letter
