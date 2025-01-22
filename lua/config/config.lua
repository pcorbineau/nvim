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

-- border style
local border_style = {
	border = "rounded",
	focusable = false,
}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, border_style)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, border_style)
vim.diagnostic.config({ float = border_style, })
