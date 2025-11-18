return require('schema-companion').setup_client(
    require('schema-companion').adapters.yamlls.setup {
        sources = {
            -- your sources for the language server
            require('schema-companion').sources.matchers.kubernetes.setup { version = 'master' },
            require('schema-companion').sources.lsp.setup(),
            require('schema-companion').sources.schemas.setup {
                {
                    name = 'Kubernetes master',
                    uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json',
                },
            },
        },
    },

    {

        cmd = { 'yaml-language-server', '--stdio' },
        filetypes = {
            'yaml',
        },

        capabilities = {
            textDocument = {
                foldingRange = {
                    dynamicRegistration = false,
                    lineFoldingOnly = true,
                },
            },
        },

        settings = {
            flags = {
                debounce_text_changes = 50,
            },

            redhat = { telemetry = { enabled = false } },

            yaml = {
                keyOrdering = false,
                format = {
                    enable = true,
                },
                validate = true,
                schemaStore = {
                    -- Must disable built-in schemaStore support to use schemas from SchemaStore.nvim plugin
                    enable = false,
                    -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                    url = '',
                },
                schemas = require('schemastore').yaml.schemas(),
            },
        },
    }
)
