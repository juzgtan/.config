return {
	"juzgtan/mayukai-nvim",
	name = "mayukai",
	lazy = false,
	priority = 1000,
	config = function()
		require("mayukai").setup()
	end,
}
