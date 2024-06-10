return {
	"jparise/vim-graphql",
	{ "s1n7ax/nvim-window-picker", tag = "v2.*" },
	"ryanoasis/vim-devicons",
	"gelguy/wilder.nvim",
	"kevinhwang91/nvim-hlslens",
	"catppuccin/nvim",
	"NvChad/nvim-colorizer.lua",
	"github/copilot.vim",
	"mg979/vim-visual-multi",
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"christoomey/vim-tmux-navigator",
	"lambdalisue/suda.vim",
	"L3MON4D3/LuaSnip",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"elkowar/yuck.vim",
	{ "Fymyte/rasi.vim", ft = "rasi" },
	"nvim-treesitter/nvim-treesitter",
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			if pcall(require, "nvim-treesitter.textobjects.repeatable_move") then
				local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
				vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
				vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
				vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
				vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
				vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
				vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
			end
		end
	},
	"max397574/better-escape.nvim",
	"preservim/tagbar",
	"akinsho/toggleterm.nvim",
	"lewis6991/gitsigns.nvim",
	"gen740/SmoothCursor.nvim",
	"lukas-reineke/indent-blankline.nvim",
	{
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	},
	"chentoast/marks.nvim",
	{
		"phaazon/hop.nvim",
		branch = "v2"
	},
	{ "goolord/alpha-nvim", requires = "nvim-tree/nvim-web-devicons" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		}
	},

	{
		"romgrk/barbar.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim"
		}
	},

	{
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons"
		}
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim"
		}
	},

	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
			opt = true
		}
	},

	"windwp/nvim-autopairs",
	{ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },
	"andweeb/presence.nvim"
}
