-- Always return the table

local plugins = {

	-- Setup Debugger nvim-dap-ui
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	-- Setup Debugger with Mason
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},

	-- Setup Main Debugger
	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			require("core.utils").load_mappings("dap")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				-- leave blank for default options
			})
		end,
	},
	{
		"Civitasv/cmake-tools.nvim",
		event = "VeryLazy",
		--   config = function()
		--     local cmake = require "cmake-tools"
		--
		--     cmake.setup {
		--      }
		--   end,
	},
	-- ==========  LSP Configuration ===========

	{
		"neovim/nvim-lspconfig",
		init = nil,
		config = function()
			require("plugins.configs.lspconfig") -- base NvChad config
			require("custom.lsp.lspconfig")
		end,
	},
	--==========  Mason Config ===============
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"clang-format",
				"stylua",
				"codelldb",
			},
		},
	},
	-- ========== Formatter ===========
	-- ================================

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			-- import conform
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					cpp = { "clang-format" },
					lua = { "stylua" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})
			vim.keymap.set({ "x", "v" }, "<leader>fm", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "LSP Formatter" })
		end,
	},

	-- require "custom.myplugs",

	-- =========== NOTHING PAST THIS LINE ================
	vim.notify("Finished loading plugins!", "error", { title = "Job finished!" }),
}
return plugins
