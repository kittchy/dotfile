return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  opts = {
    debug = false, -- Enable debugging
    model = "gpt-3.5-turbo",

    question_header = "## You 🙋 ", -- Header to use for user questions
    answer_header = "## Copilot 🤖 ", -- Header to use for AI answers
    error_header = "## Error ⚠️ ", -- Header to use for errors
    separator = "=================", -- Separator to use in chat
  },
}
