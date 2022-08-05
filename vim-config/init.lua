local cmd = vim.cmd       -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn         -- to call Vim functions e.g. fn.bufnr()
local g = vim.g           -- a table to access global variables
local opt = vim.opt       -- to set options

local function map(mode, lhs, rhs, opts)
  local options = { silent = true, noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- general options
cmd 'colorscheme molokai'
opt.syntax = 'on'
opt.filetype = 'on'
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 0
opt.shiftwidth = 2
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.smartcase = true
opt.ignorecase = true
opt.modeline = true
opt.compatible = false
opt.encoding = 'utf-8'
opt.incsearch = true
opt.hlsearch = true
opt.history=700
opt.number = true
opt.laststatus = 2
opt.signcolumn = 'yes'

opt.termguicolors = true
opt.background = 'dark'
g.airline_theme = 'molokai'

-- ripgrep
opt.grepprg = 'rg --'
map('n', '<silent> F', ':Rg<CR>')

-- ctrlp
g.ctrlp_user_command = 'fd -H --type f --color=never "" %s'
g.ctrlp_use_caching = 0

g['fruzzy#usenative'] = 1
g.ctrlp_match_func = {match = 'fruzzy#ctrlp#matcher'}

-- use CTRL+Space to autocomplete
map('i', '<C-Space>', '<C-x><C-o>')
map('i', '<C-@>', '<C-Space>')

g.delimitMate_expand_cr = 1
g.delimitMate_expand_space = 1

-- Enable integration with airline.
g['airline#extensions#ale#enabled'] = 1

-- Error and warning signs.
g.ale_sign_error = '⤫'
g.ale_sign_warning = '⚠'

-- disbale deno as a linter
g.ale_linters_ignore = {
  typescript = {'deno'},
  typescriptreact = {'deno'},
  nix = {'nix', 'statix'},
}

g.rooter_patterns = {'package.json', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/'}

-- vim-go
g.go_highlight_build_constraints = 1
g.go_highlight_extra_types = 1
g.go_highlight_fields = 1
g.go_highlight_functions = 1
g.go_highlight_methods = 1
g.go_highlight_operators = 1
g.go_highlight_structs = 1
g.go_highlight_types = 1

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    map('n', '<leader>b', '<Plug>(go-build)')
    map('n', '<leader>r', '<Plug>(go-run)')
    map('n', '<leader>t', '<Plug>(go-test)')
    map('n', '<leader>c', '<Plug>(go-coverage-toggle)')
  end,
})

-- markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- LSP
map('n', 'E', vim.diagnostic.open_float)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['nimls'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require('lspconfig')['ocamllsp'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    cmd = { 'pnpm', '--package=typescript-language-server', '--package=typescript', 'dlx', 'typescript-language-server', '--stdio'  },
}
require('lspconfig')['zls'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require('lspconfig')['dockerls'].setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    cmd = { 'pnpm', 'dlx', "dockerfile-language-server-nodejs", "docker-langserver", "--stdio" }
}
require'lspconfig'.terraform_lsp.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
}
