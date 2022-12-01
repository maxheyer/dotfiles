local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()
require("fidget").setup()
require("treesitter-context").setup()

local luasnip = require("luasnip")

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    --      completion = cmp.config.window.bordered(),
    --      documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<cr>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {"i", "s"}),
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "treesitter" },
    { name = "luasnip" },
    { name = "buffer" },
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
      { name = "buffer" },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
      { name = "cmdline" }
    })
})

local function lsp_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  local on_attach = function(client, bufnr)
    require "lsp_signature".on_attach(signature_setup, bufnr)
  end

  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
  }
end

local lspconfig_servers = {
  "phpactor",
  "cssls",
  "html",
  "jsonls",
  "tsserver",
  "rust_analyzer",
  "gopls",
  "vuels",
  "prismals",
}

local config = lsp_config()

for _, server in pairs(lspconfig_servers) do
  require'lspconfig'[server].setup(config)
end

require'lspconfig'.omnisharp.setup {
    cmd = { "dotnet", "~/.omnisharp/OmniSharp.dll" },
}

local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
map('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
map('n', '<space>rn', '<cmd>Lspsaga rename<cr>', opts)
map('n', '<space>ca', '<cmd>Lspsaga code_action<cr>', opts)
