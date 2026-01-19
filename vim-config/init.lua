local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options

local function map(mode, lhs, rhs, opts)
    local options = {silent = true, noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- general options
cmd 'colorscheme molokai'
-- opt.mouse = ''
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
opt.history = 700
opt.number = true
opt.laststatus = 2
opt.signcolumn = 'yes'

-- Backup files
-- Double slash to build file name from the complete path to the file with all path separators changed to percent '%' signs
opt.backupdir = fn.expand('$HOME/.nvim-backup//')
opt.backup = true
opt.swapfile = false

-- diff config
opt.diffopt:append({
    "iwhite",
    "vertical",
    "filler",
    "algorithm:histogram",
    "indent-heuristic"
})

-- consider using timestamps and systemd cleanup job
-- https://www.reddit.com/r/neovim/comments/wlkq0e/neovim_configuration_to_backup_files_with/

opt.termguicolors = true
opt.background = 'dark'
g.airline_theme = 'molokai'

g.markdown_fenced_languages = {
    'javascript', 'js=javascript', 'json=javascript', 'typescript',
    'ts=typescript', 'bash', 'sh', 'shell=sh'
}

-- fzf

require'fzf-lua'.setup {winopts = {preview = {hidden = 'hidden'}}}

function getCwd(scope)
    scope = scope or 'repo'
    if (scope == 'repo') then
        return require("fzf-lua.path").git_root(vim.loop.cwd(), true) or
                   vim.loop.cwd()
    elseif (scope == 'package') then
        return vim.loop.cwd()
    end
end

function fzf_defaults(scope)
    local path = getCwd(scope)
    return {
        cwd = path,
        fzf_cli_args = ('--header="cwd = %s"'):format(vim.fn.shellescape(path))
    }
end

function searchFiles(scope)
    local opts = fzf_defaults(scope)
    opts.cmd = vim.env.FZF_DEFAULT_COMMAND

    if vim.fn.expand('%:p:h') ~= vim.loop.cwd() then
        opts.cmd = opts.cmd ..
                       (" | proximity-sort %s"):format(vim.fn.expand('%'))
    end
    opts.prompt = "> "
    opts.fzf_opts = {
        ['--info'] = 'inline',
        ['--layout'] = 'reverse',
        ['--tiebreak'] = 'index'
    }
    require("fzf-lua").files(opts)
end

function searchWord(scope) require("fzf-lua").grep_cword(fzf_defaults(scope)) end

function liveGrep(scope) require("fzf-lua").live_grep(fzf_defaults(scope)) end

map('n', '<C-b>', '<cmd>lua require("fzf-lua").buffers()<cr>')

map('n', '<C-p>', '<cmd>lua searchFiles("package")<cr>')
map('n', '<C-a><C-p>', '<cmd>lua searchFiles("repo")<cr>')

map('n', '<S-f>', '<cmd>lua searchWord("package")<cr>')

map('n', '<C-f>', '<cmd>lua liveGrep("package")<cr>')
map('n', '<C-a><C-f>', '<cmd>lua liveGrep("repo")<cr>')

map('n', '<C-a><C-a>', '<cmd>lua require("fzf-lua").resume()<cr>')

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

g.ale_fix_on_save = 1
-- g.ale_javascript_prettier_use_global = 1

g.ale_linters = {
    json = {'prettier'},
    javascript = {'prettier', 'eslint'},
    typescript = {'prettier', 'eslint'},
    javascriptreact = {'prettier', 'eslint'},
    typescriptreact = {'prettier', 'eslint'},
    terraform = {'terraform', 'terraform_lsp'}
}

g.ale_fixers = {
    ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
    json = {'prettier'},
    javascript = {'prettier', 'eslint'},
    typescript = {'prettier', 'eslint'},
    javascriptreact = {'prettier', 'eslint'},
    typescriptreact = {'prettier', 'eslint'},
    astro = {'prettier'},
    rust = {'rustfmt'},
    terraform = {'terraform'}
}

-- disbale deno as a linter
g.ale_linters_ignore = {
    typescript = {'deno'},
    typescriptreact = {'deno'},
    nix = {'nix', 'statix'}
}

g.rooter_patterns = {
    'package.json', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/'
}

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
    end
})

-- json
vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    callback = function() vim.opt_local.tabstop = 2 end
})

-- markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function() vim.opt_local.spell = true end
})

-- tiltfile
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.tiltfile",
    callback = function() vim.opt_local.filetype = "starlark" end
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
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.util.rename, bufopts)
    vim.keymap.set('n', 'ca', require("actions-preview").code_actions)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = vim.lsp.config

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    completion = {keyword_length = 2},
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ["<esc>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.abort()
            else
                fallback()
            end
        end, {'i', 'c'}),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    }),
    sources = {
        {name = 'nvim_lsp'}, {name = 'luasnip'},
        -- { name = 'buffer' }, -- single buffer source
        { -- all buffers source
            name = 'buffer',
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        }, {name = 'path'}
    }
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{name = 'buffer'}}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
})

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150
}
lspconfig('nim_langserver', {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
})
lspconfig('ocamllsp', {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
})
lspconfig('pyright', {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
})
lspconfig('ts_ls', {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    cmd = {
        'pnpm', '--package=typescript-language-server@3.3.2', '--package=typescript',
        'dlx', 'typescript-language-server', '--stdio'
    }
})
lspconfig('zls', {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
})
lspconfig('rust_analyzer', {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {["rust-analyzer"] = {
        checkOnSave = {
            command = "clippy";
        }
    }}
})
lspconfig('dockerls', {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    cmd = {
        'pnpm', 'dlx', "dockerfile-language-server-nodejs", "docker-langserver",
        "--stdio"
    }
})
lspconfig('terraform_lsp', {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
})

require"lsp_signature".setup({
    toggle_key = '<C-x>',
    select_signature_key = '<C-s>'
})

function CopySelectionWithFileRef()
    local filepath = vim.fn.expand('%:p')
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    if start_pos[2] == 0 or end_pos[2] == 0 then
        vim.notify('No visual selection', vim.log.levels.WARN)
        return
    end

    local start_line = start_pos[2]
    local end_line = end_pos[2]
    local start_col = start_pos[3]
    local end_col = end_pos[4]

    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
    local text
    if start_line == end_line then
        text = lines[1]:sub(start_col, end_col - 1)
    else
        text = table.concat(lines, '\n')
    end

    local prefix
    local line_length = #lines[1]
    local is_whole_line = start_col == 1 and end_col > line_length

    if start_line == end_line then
        if is_whole_line then
            prefix = string.format('%s:%d', filepath, start_line)
        else
            prefix = string.format('%s:%d:%d-%d', filepath, start_line, start_col, end_col - 1)
        end
    else
        prefix = string.format('%s:%d-%d', filepath, start_line, end_line)
    end

    local result = prefix .. ':\n' .. text

    vim.fn.setreg('+', result)
    vim.fn.setreg('*', result)

    vim.notify('Copied: ' .. prefix, vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('CopySelectionWithFileRef', CopySelectionWithFileRef, {range = true})

map('v', '<C-y>', ':CopySelectionWithFileRef<cr>')
