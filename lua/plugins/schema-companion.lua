return {
    'cenk1cenk2/schema-companion.nvim',
    ft = { 'yaml', 'helm' },
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
    },
    config = function()
        require('schema-companion').setup {
            -- log_level = vim.log.levels.DEBUG,
        }

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function()
                require('schema-companion').match()

                vim.keymap.set(
                    'n',
                    '<leader>ks',
                    "<cmd>lua require('schema-companion').select_matching_schema()<CR>",
                    { desc = 'Select from matching schemas' }
                )

                vim.keymap.set(
                    'n',
                    '<leader>kf',
                    "<cmd>lua require('schema-companion').select_schema()<CR>",
                    { desc = 'Select from all schemas' }
                )

                vim.keymap.set(
                    'n',
                    '<leader>kr',
                    "<cmd>lua require('schema-companion').match()<CR>",
                    { desc = 'Rematch schema' }
                )

                vim.keymap.set(
                    'n',
                    '<leader>kk',
                    "<cmd>lua require('schema-companion.sources.matchers.kubernetes').change_version()<CR>",
                    { desc = 'Set Kubernetes version' }
                )
            end,
        })
    end,
}
