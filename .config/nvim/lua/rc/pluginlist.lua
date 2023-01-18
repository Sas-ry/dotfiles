local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

----------------------------------------------------------------
---- Load local plugins
local function load_local_plugins()
	if vim.fn.filereadable(vim.fn.expand("~/.nvim_pluginlist_local.lua")) == 1 then
		return dofile(vim.fn.expand("~/.nvim_pluginlist_local.lua"))
	end
end
local local_plugins = load_local_plugins() or {}

----------------------------------------------------------------
local plugins = {

  ---------------------------
  -- Installer
  { "folke/lazy.nvim" },

  ---------------------------
  -- External package Installer(successor to nvim-lsp-installer)
  {
    "williamboman/mason.nvim",
    event = "BufReadPre",
    config = function()
            require("rc/pluginconfig/mason")
    end,
  },

  ---------------------------
  -- Font
  { 
    "kyazdani42/nvim-web-devicons", 
    event = "BufReadPre",
  },

  ---------------------------
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
            require("rc/pluginconfig/lualine")
    end,
  },

  ---------------------------
  -- Filer
  {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VimEnter",
    branch = "main",
    config = function()
            require("rc/pluginconfig/neo-tree")
    end,
  },

  ---------------------------
  -- Sidebar
  -- conflict with clever-f (augroup sidebar_nvim_prevent_buffer_override)
  {
    "GustavoKatel/sidebar.nvim",
    event = "BufReadPre",
    cmd = { "SidebarNvimToggle" },
    config = function()
            require("rc/pluginconfig/sidebar")
    end,
  },

  ---------------------------
  -- ColorScheme
  { 
    "ellisonleao/gruvbox.nvim",
    event = { "BufReadPre", "BufWinEnter" },
    config = function()
            require("rc/pluginconfig/gruvbox")
    end,
  },
  -- Statusline ColorScheme
  {
    "EdenEast/nightfox.nvim",
    event = { "BufReadPre", "BufWinEnter" },
    config = function()
            require("rc/pluginconfig/nightfox")
    end,
  },

  ---------------------------
  -- FuzzyFinders
  -- telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    event = { "VimEnter" },
    config = function()
            require("rc/pluginconfig/telescope")
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
                require("telescope").load_extension("frecency")
        end,
      },
      {
        "nvim-telescope/telescope-github.nvim",
        config = function()
                require("telescope").load_extension("gh")
        end,
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
                require("telescope").load_extension("ui-select")
        end,
      },
      {
        "crispgm/telescope-heading.nvim",
        config = function()
                require("telescope").load_extension("heading")
        end,
      },
      {
        "LinArcX/telescope-changes.nvim",
        config = function()
                require("telescope").load_extension("changes")
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
                require("telescope").load_extension("live_grep_args")
        end,
      },
      {
        "nvim-telescope/telescope-smart-history.nvim",
        config = function()
                require("telescope").load_extension("smart_history")
        end,
        build = function()
                os.execute("mkdir -p " .. vim.fn.stdpath("state") .. "databases/")
        end,
      },
      { "nvim-telescope/telescope-symbols.nvim" },
      {
        "nvim-telescope/telescope-media-files.nvim",
        enabled = function()
                return vim.fn.executable("ueberzug")
        end,
        config = function()
                require("telescope").load_extension("media_files")
        end,
      },
    },
  },

  ---------------------------
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
            require("rc/pluginconfig/gitsigns")
    end,
  },

  ---------------------------
  -- LSP & completion
  ---------------------------
  -- Auto Completion
  {
    "hrsh7th/nvim-cmp",
    event = "VimEnter",
    config = function()
            require("rc/pluginconfig/nvim-cmp")
    end,
    dependencies = {
      { "windwp/nvim-autopairs" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-calc" },
      { "f3fora/cmp-spell" },
      { "yutkat/cmp-mocword" },
      {
        "uga-rosa/cmp-dictionary",
        config = function()
                require("rc/pluginconfig/cmp-dictionary")
        end,
      },
      { "saadparwaiz1/cmp_luasnip" },
      { 
        "tzachar/cmp-tabnine",
        build = "./install.sh",
      },
      { "ray-x/cmp-treesitter" },
      { "lukas-reineke/cmp-rg" },
      { "lukas-reineke/cmp-under-comparator" },
      {
        "onsails/lspkind-nvim",
        config = function()
                require("rc/pluginconfig/lspkind-nvim")
        end,
      },
    },
  },

  ---------------------------
  -- Language Server Protocol(LSP)
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
            require("rc/pluginconfig/nvim-lspconfig")
    end,
    dependencies = {
      {
        "folke/neoconf.nvim",
        config = function()
                require("rc/pluginconfig/neoconf")
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
                require("rc/pluginconfig/mason-lspconfig")
        end,
      },
      { "weilbith/nvim-lsp-smag", after = "nvim-lspconfig" },
    },
  },

  ---------------------------
  -- LSP's UI
  {
    "glepnir/lspsaga.nvim",
    event = "VimEnter",
    config = function()
            require("rc/pluginconfig/lspsaga")
    end,
  },
  {
    "folke/lsp-colors.nvim",
  },
  {
    "folke/trouble.nvim",
    event = "VimEnter",
    config = function()
            require("rc/pluginconfig/trouble")
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "VimEnter",
    config = function()
            require("rc/pluginconfig/fidget")
    end,
  },

  ---------------------------
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
		event = { "VimEnter" },
		build = ":TSUpdateSync",
		config = function()
			require("rc/pluginconfig/nvim-treesitter")
		end,
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "nvim-treesitter/nvim-treesitter-refactor" },
			{ "nvim-treesitter/nvim-tree-docs" },
			{ "vigoux/architext.nvim" },
			{ "yioneko/nvim-yati" },
		},
  },

  --------------------------------
	-- Treesitter textobject & operator
	{ "nvim-treesitter/nvim-treesitter-textobjects", event = "VimEnter" },
	{
		"chrisgrieser/nvim-various-textobjs",
		event = "VimEnter",
		config = function()
			require("rc/pluginconfig/nvim-various-textobjs")
		end,
	},


  --------------------------------
  -- Coding(Writing assist)
  { 
    "nmac427/guess-indent.nvim",
    event = { "BufNewFile", "BufReadPre" },
    config = function()
            require("guess-indent").setup()
    end,
  },


  --------------------------------
  -- Brackets
  {
    "theHamsta/nvim-treesitter-pairs",
    event = "VimEnter",
  },
  {
    "hrsh7th/nvim-insx",
		event = "VimEnter",
		config = function()
			require("rc/pluginconfig/nvim-insx")
		end,
  },

  ---------------------------
  -- Lua Library
  { "nvim-lua/popup.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "kkharji/sqlite.lua"},

  ---------------------------
  -- Snippet
  { 
    "L3MON4D3/LuaSnip",
    event = "VimEnter",
    config = function()
            require("rc/pluginconfig/LuaSnip")
    end,
  },
  {
    "benfowler/telescope-luasnip.nvim",
    event = "VimEnter",
    config = function()
            require("telescope").load_extension("luasnip")
    end,
  },
}

require("lazy").setup(vim.tbl_deep_extend("force", plugins, local_plugins), {
	defaults = {
		lazy = true, -- should plugins be lazy-loaded?
	},
})
