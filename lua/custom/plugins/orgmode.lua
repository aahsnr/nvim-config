return {
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    event = 'VeryLazy',
    config = function()
      require('orgmode').setup {
        org_agenda_files = '~/org/**/*',
        org_default_notes_file = '~/org/refile.org',
      }
    end,
  },

  {
    'nvim-orgmode/org-bullets.nvim',
    dependencies = { 'nvim-orgmode/orgmode' },
    config = function()
      require('org-bullets').setup()
    end,
  },
}
