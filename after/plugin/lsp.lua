local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local lspconfig = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lspconfig.lua_ls.setup({})
lspconfig.gopls.setup({
  filetypes = { "go", "gomod", "gowork", "gotmpl" }, -- Definindo filetypes específicos
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})
-- esLint
lspconfig.eslint.setup({
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space'] = cmp.mapping.complete(),
})

cmp.setup({
  mapping = cmp_mappings,
  -- outras configurações
})


lsp_zero.set_preferences({
    sign_icons = {
    error = "✘",
    warn = "⚠",
    info = "ℹ",
    hint = "➤"
  }
 })
