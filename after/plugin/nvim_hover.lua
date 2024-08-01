local hover = require("hover")

-- Setup keymaps
vim.keymap.set("n", "<leader>K", hover.hover, { desc = "hover.nvim" })
vim.keymap.set("n", "<leader>KG", hover.hover_select, { desc = "hover.nvim (select)" })
vim.keymap.set("n", "<C-p>", function() hover.hover_switch("previous") end, { desc = "hover.nvim (previous source)" })
vim.keymap.set("n", "<C-n>", function() hover.hover_switch("next") end, { desc = "hover.nvim (next source)" })

-- Mouse support
vim.keymap.set('n', '<MouseMove>', hover.hover_mouse, { desc = "hover.nvim (mouse)" })
vim.o.mousemoveevent = true

