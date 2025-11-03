-- vim-playground neovim設定ファイル
-- このファイルはホストで編集し、コンテナにマウントして使用します

-- lazy.nvim のブートストラップ
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグイン設定
require("lazy").setup({
  -- mini.nvim 基本セット
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      -- mini.pairs: 括弧の自動ペア入力
      require("mini.pairs").setup()

      -- mini.surround: テキストの囲み操作
      -- 使い方: sa{motion}{char} で囲む, sd{char} で削除, sr{old}{new} で置換
      require("mini.surround").setup()

      -- mini.comment: コメントアウト
      -- 使い方: gcc で行コメント, gc{motion} でモーション範囲をコメント
      require("mini.comment").setup()
    end,
  },
})

-- 基本設定
vim.opt.number = true              -- 行番号を表示
vim.opt.relativenumber = true      -- 相対行番号を表示
vim.opt.expandtab = true           -- タブをスペースに展開
vim.opt.shiftwidth = 2             -- インデント幅
vim.opt.tabstop = 2                -- タブ幅
vim.opt.smartindent = true         -- スマートインデント
vim.opt.wrap = false               -- 行の折り返しを無効化
vim.opt.cursorline = true          -- カーソル行をハイライト
vim.opt.termguicolors = true       -- True colorサポート
vim.opt.signcolumn = "yes"         -- サインカラムを常に表示
vim.opt.updatetime = 300           -- 更新時間を短縮
vim.opt.mouse = "a"                -- マウスサポートを有効化

-- 検索設定
vim.opt.ignorecase = true          -- 検索時に大文字小文字を区別しない
vim.opt.smartcase = true           -- 大文字が含まれる場合は区別する
vim.opt.hlsearch = true            -- 検索結果をハイライト
vim.opt.incsearch = true           -- インクリメンタルサーチ

-- キーマップ設定
vim.g.mapleader = " "              -- リーダーキーをスペースに設定

-- ノーマルモードのキーマップ
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "ファイルを保存" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "終了" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "検索ハイライトを消去" })

-- ウィンドウ分割のキーマップ
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "ウィンドウを垂直分割" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "ウィンドウを水平分割" })

-- バッファ移動のキーマップ
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "次のバッファ" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "前のバッファ" })

print("init.lua loaded successfully!")
