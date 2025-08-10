return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = { "markdownlint" },
    },
    linters = {
      markdownlint = {
        -- To disable a rule, add it to the 'disable' table
        args = { "--disable", "MD013" },
      },
    },
  },
}
