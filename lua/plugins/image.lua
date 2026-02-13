return {
        "3rd/image.nvim",
        build = false,     -- or "luarocks install magick" if you need it
        opts = {
                backend = "kitty", -- Works natively with Ghostty
                integrations = {
                        markdown = {
                                enabled = true,
                                clear_in_insert_mode = false,
                                download_remote_images = true,
                                only_render_image_at_cursor = false,
                                filetypes = { "markdown", "vimwiki" },
                        },
                        neorg = {
                                enabled = true,
                                clear_in_insert_mode = false,
                                download_remote_images = true,
                                only_render_image_at_cursor = false,
                                filetypes = { "norg" },
                        },
                },
                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                max_height_window_percentage = 50,
                window_overlap_clear_enabled = false, -- toggles images when windows interact
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
}
