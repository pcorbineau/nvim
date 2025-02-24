return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = { enabled = true },
        input = { enabled = true },
        picker = {
            enabled = true,
            ui_select = true,
        },
    },
    keys = {
        { "<leader>ff", function() Snacks.picker.files() end,     desc = "Find Files" },
        { "<leader>fh", function() Snacks.picker.help() end,      desc = "Help Pages" },
        { "<leader>/",  function() Snacks.picker.grep() end,      desc = "Grep" },
        { "<leader>fe", function() Snacks.explorer() end,         desc = "File Explorer" },
        { "<leader>lg", function() Snacks.lazygit() end,          desc = "Open Lazygit" },
        { "<leader>lf", function() Snacks.lazygit.log_file() end, desc = "git log current file" },
        { "<leader>lR", function() Snacks.picker.resume() end,    desc = "Resume" },
    },
}
