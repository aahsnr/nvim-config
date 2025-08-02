-- lua/custom/plugins/markdown.lua
return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- If you want to use the plugin only for markdown files,
    -- you can add the ft = "markdown" option.
    ft = { 'markdown' },
    config = function()
      require('render-markdown').setup {
        -- Highlights can be customized here.
        -- For example, to make headers larger and more distinct.
        highlights = {
          -- Use a group that stands out, like a function name, for headers.
          -- The level is the markdown header level, e.g., #, ##, ###
          header = {
            [1] = { group = 'Function' },
            [2] = { group = 'Type' },
            [3] = { group = 'Identifier' },
          },
          -- Make code blocks look like comments
          code_block = { group = 'Comment' },
        },
        -- Other options can be configured here.
        -- For a full list, see the plugin's documentation.
      }
    end,
  },
}
