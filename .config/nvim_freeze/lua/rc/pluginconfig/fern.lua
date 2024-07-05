local fern = require("fern")
fern.setup({
  default_hidden = 1,
  renderer = "nerdfont",
})

vim.api.nvim_set_keymap('n', '<C-n>', ':Fern . -reveal=% -drawer -toggle -width=30<CR>', {noremap = true}),
vim.api.nvim_create_augroup( 'my-glyph-palette', {} ),
vim.api.nvim_create_autocmd( 'FileType', {
  group = my-glyph-palette,
  pattern = {'fern','nerdtree','startify'},
  callback = function() glyph_palette#apply() end,
})
