local M = {}
-- disabled plugins
M.disabled = {}
M.keymap = {
  n = {
    ["<leader>l"] = { "<cmd> Lazy <CR>", "Lazy Manager" },

    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle NvimTree" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dc"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "Start/Resume Debugger",
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "Step Over",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "Step Into",
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "Step out",
    },
  },
}

return M

--  vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy Manager" }),

-- Nvim-Tree toggle
--  vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" }),

--  vim.keymap.set("n", "<C-n>", "<cmd><cr>"),
