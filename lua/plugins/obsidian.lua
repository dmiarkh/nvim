return {
    "epwalsh/obsidian.nvim",
    version = "*",
    cmd = "ObsidianNew",
    event = {
        "BufReadPre /home/arch/Notes/**.md",
        "BufNewFile /home/arch/Notes/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/Notes/",
            },
        },
        ui = {
            enable = false,
        },
        new_notes_location = "current_dir",
    },
}
