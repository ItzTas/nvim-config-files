return {
    {
        "benlubas/image-save.nvim",
        -- enabled = false,
        -- dev = true,
        cmd = "SaveImage",
    },
    {
        "3rd/image.nvim",
        opts = {
            max_width = 100,
            max_height = 12,
            backend = "kitty",
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
    },
}
