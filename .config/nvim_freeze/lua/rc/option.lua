vim.o.history = 10000
vim.o.timeout = true
vim.o.timeoutle = 500

-- Tab config
vim.o.tabstop = 2 -- タブを何文字の空白に変換
vim.o.shiftwidth = 2 -- 自動インデント空白数
vim.o.expandtab = true -- タブを空白文字に展開

-- Command config
vim.o.wildmenu = true -- コマンド補完を強化
vim.o.wildmode = "longest,list,full" -- リスト表示,最長マッチ


-- Search config
vim.o.wrapscan = true -- 最後まで検索したら先頭へ戻る
vim.o.ignorecase = true -- 大文字小文字無視
vim.o.smartcase = true -- 大文字ではじめたら大文字小文字無視しない
vim.o.incsearch = true -- インクリメンタルサーチ
vim.o.hlsearch = true -- 検索文字をハイライト


-- File config
vim.o.autoread = true -- ほかで書き換えられたら自動で読み直す
vim.o.swapfile = false -- スワップファイルを作らない
vim.o.hidden = true -- 編集中でもほかのファイルを開けるようにする

-- clipboard
-- + reg: Ctrl-v nnamedplus
-- * reg: middle click unnamed
if vim.fn.has("clipboard") == 1 then
  vim.o.clipboard = "unnamedplus,unnamed"
end

-- beep sound
vim.o.errorbells = false
vim.o.visualbell = false
