return {
    "windwp/nvim-autopairs",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
        map_c_w = true,
        fast_wrap = {
            map = '<M-e>',
            chars = { '{', '[', '(', '"', "'" },
            pattern = [=[[%'%"%>%]%)%}%,]]=],
            end_key = '$',
            -- NOTE: check out shortcuts
            before_key = 'h',
            after_key = 'l',
            cursor_pos_before = true,
            keys = 'qwertyuiopzxcvbnmasdfghjkl',
            manual_position = true,
            highlight = 'Search',
            highlight_grey = 'Comment'
        },
    }
}
