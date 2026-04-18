return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = false, -- hide filtered items on open
				hide_gitignored = true,
				hide_dotfiles = false,
				hide_by_name = {
					".github",
					".gitignore",
					"package-lock.json",
					".changeset",
					".prettierrc.json",
				},
				never_show = { ".git" },
			},
		},
	},
}
