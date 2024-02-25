local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING

vim.notify_once(
    [[[null-ls] You required a deprecated builtin (formatting/trim_newlines.lua), which will be removed in March.
Please migrate to alternatives: https://github.com/nvimtools/none-ls.nvim/issues/58]],
    vim.log.levels.WARN
)

return h.make_builtin({
    name = "trim_newlines",
    meta = {
        description = "A simple wrapper around `awk` to remove trailing newlines.",
    },
    method = FORMATTING,
    filetypes = {},
    generator_opts = {
        command = "awk",
        args = { 'NF{print s $0; s=""; next} {s=s ORS}' },
        to_stdin = true,
    },
    factory = h.formatter_factory,
})
