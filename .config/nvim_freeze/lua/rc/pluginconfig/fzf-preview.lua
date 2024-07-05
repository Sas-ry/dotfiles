local fzf-preview = require("fzf-preview")

vim.o.$BAT_THEME = "gruvbox-dark"
vim.o.$FZF_PREVIEW_PREVIEW_BAT_THEME = "gruvbox-box"
fzf-preview.setup()

vim.api.nvim_set_keymap("n", "<Plug>(ff)r", "<Cmd>CocCommand fzf-preview.ProjectFiles<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Plug>(ff)s", "<Cmd>CocCommand fzf-preview.GitStatus<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Plug>(ff)gg", "<Cmd>CocCommand fzf-preview.GitActions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Plug>(ff)b", "<Cmd>CocCommand fzf-preview.Buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Plug>(ff)f", ":<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<Plug>(lsp)q", "<Cmd>CocCommand fzf-preview.CocCurrentDiagnostics<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Plug>(lsp)rf", "<Cmd>CocCommand fzf-preview.CocReferences<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Plug>(lsp)d", "<Cmd>CocCommand fzf-preview.CocDefinition<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Plug>(lsp)t", "<Cmd>CocCommand fzf-preview.CocTypeDefinition<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Plug>(lsp)o", "<Cmd>CocCommand fzf-preview.CocOutline --add-fzf-arg=--exact --add-fzf-arg=--no-sort<CR>", { noremap = true, silent = true })
