-- after/ftdetect/gotmpl.lua
vim.filetype.add {
    pattern = {
        ['.*%.ya?ml%.gotmpl'] = 'yaml.gotmpl',
    },
    filename = {
        ['helmfile.yaml.gotmpl'] = 'yaml.gotmpl',
    },
}
