-- General Settings
local general = vim.api.nvim_create_augroup("General", { clear = true })

-- disable auto comment on newline
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    command = "set formatoptions-=cro",
    group = general,
    desc = "Disable new line comment",
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        local cnmap = function(method, keys, func, desc)
            if client and client.supports_method(method) then
                nmap(keys, func, desc)
            end
        end
        -- Create a keymap for vim.lsp.buf.implementation
        cnmap("textDocument/hover", 'K', vim.lsp.buf.hover, "Hover Docs")
        cnmap("textDocument/hover", 'gd', vim.lsp.buf.definition, "[g]oto [d]efinition")
        cnmap("textDocument/hover", 'gD', vim.lsp.buf.declaration, "[g]oto [D]eclaration")
        cnmap("textDocument/hover", 'gi', vim.lsp.buf.implementation, "[g]oto [i]mplementation")
        cnmap("textDocument/hover", 'go', vim.lsp.buf.type_definition, "Type [de]finition")
        cnmap("textDocument/hover", '<leader>rn', vim.lsp.buf.rename, "[r]e[n]ame")
        cnmap("textDocument/hover", '<leader>ca', vim.lsp.buf.code_action, "[c]ode [a]ction")
        if client and client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})
