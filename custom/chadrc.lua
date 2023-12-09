---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  transparency = false,
}

M.plugins = "custom.plugins"

-- M.ui = {
--   cmp = { lspkind = false },
-- lsp = { signaure = { disabled = true } },
-- }
--M.plugins = "shadow_plugs.noice"

M.mappings = require "custom.mappings"

return M
