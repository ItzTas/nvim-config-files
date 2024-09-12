return {
	"vhyrro/luarocks.nvim",
	priority = 1000,
	opts = {
		rocks = { "neotest-golang" },
		install = {
			force_lock = true,
		},
	},
	config = true,
}
