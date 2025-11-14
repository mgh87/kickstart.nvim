return {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
        -- delay between pressing a key and opening which-key (milliseconds)
        -- this setting is independent of vim.o.timeoutlen
        delay = 350,
        icons = {
            -- set icon mappings to true if you have a Nerd Font
            mappings = vim.g.have_nerd_font,
        },

        -- Document existing key chains
        spec = {
            { '<leader>s', group = '[S]earch' },
            { '<leader>t', group = '[T]oggle' },
            { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        },
    },
}
