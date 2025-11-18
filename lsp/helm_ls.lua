return require('schema-companion').setup_client(
    require('schema-companion').adapters.helmls.setup {
        sources = {
            -- your sources for the language server
            require('schema-companion').sources.matchers.kubernetes.setup { version = 'master' },
        },
    },
    {
        filetypes = { 'helm' },
        root_markers = { { 'Chart.yaml' } },
        cmd = {
            'helm_ls',
            'serve',
        },
        settings = {
            logLevel = 'info',
            valuesFiles = {
                mainValuesFile = 'values.yaml',
                lintOverlayValuesFile = 'values.lint.yaml',
                additionalValuesFilesGlobPattern = 'values*.yaml',
            },
            helmLint = {
                enabled = true,
                ignoredMessages = {},
            },
            yamlls = {
                enabled = true,
                enabledForFilesGlob = '*.{yaml,yml}',
                diagnosticsLimit = 50,
                showDiagnosticsDirectly = false,
                path = { 'yaml-language-server', '--stdio' }, -- or something like { "node", "yaml-language-server.js" }
                initTimeoutSeconds = 3,
                config = {
                    schemas = {
                        kubernetes = 'templates/**',
                    },
                    completion = true,
                    hover = true,
                    -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
                },
            },
        },
    }
)
