return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                { "williamboman/mason.nvim", opts = {} },
            },
            opts = {
                automatic_installation = true,
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {}
                    end,
                    ["lua_ls"] = function()
                        require("lspconfig").lua_ls.setup {
                            on_init = function(client)
                                if client.workspace_folders then
                                    local path = client.workspace_folders[1].name
                                    if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
                                        return
                                    end
                                end

                                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua,
                                    {
                                        runtime = {
                                            version = 'LuaJIT'
                                        },
                                        workspace = {
                                            checkThirdParty = false,
                                            library = {
                                                vim.env.VIMRUNTIME,
                                                "${3rd}/luv/library",
                                                vim.fn.stdpath("data") .. "/lazy",
                                            }
                                        }
                                    })
                            end,
                            settings = {
                                Lua = {}
                            }
                        }
                    end,
                },
            },
        },
    },
}
