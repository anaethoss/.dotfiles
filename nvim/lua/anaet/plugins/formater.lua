return {
        'stevearc/conform.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            formatters_by_ft = {
                css = { 'prettier' },
                html = { 'prettier' },
                java = { 'prettier' },
                javascript = { 'prettier' },
                json = { 'prettier' },
                tex = { 'latexindent' },
                lua = { 'stylua' },
                markdown = { 'prettier' },
                php = { 'prettier' },
                python = { 'black' },
                rust = { 'rustfmt' },
                scss = { 'prettier' },
                typst = { 'typstfmt' },
                vue = { 'prettier' },
                yaml = { 'yamlfmt' },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
            -- formatters = {
            --     latexindent = {
            --         prepend_args = { '-l', '/Users/ilias/.indentconfig.yaml' },
            --     },
            -- },
        },
    }
