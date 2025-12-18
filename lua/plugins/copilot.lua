return {
    'zbirenbaum/copilot.lua',
    dependencies = {
        'copilotlsp-nvim/copilot-lsp', -- (optional) for NES functionality
        'AndreM222/copilot-lualine',
    },
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
        require('copilot').setup {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = { accept = '<S-Tab>', next = '<A-Tab>', dismiss = '<C-c>' },
            },
            -- panel = { enabled = false, auto_refresh = true },
            panel = { enabled = false },
            filetypes = {
                -- explicitly enable/disable filetypes
                dockerfile = true,
                go = true,
                lua = true,
                make = true,
                python = true,
                sh = true,
                terraform = true,
                yaml = true,
                ['*'] = false, -- disable for all other filetypes and ignore default `filetypes`
            },
        }
    end,
}
