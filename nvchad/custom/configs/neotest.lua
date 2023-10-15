local neotest = require "neotest"

neotest.setup {
  adapters = {
    require "neotest-jest" {
      jestCommand = "npm test --",
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    },
    require "neotest-vitest" {},
    require "neotest-go" {
      -- args = { "-tags=integration" },
    },
  },
  status = { virtual_text = true },
  output = { open_on_run = true },
  quickfix = {
    open = function()
      vim.cmd "Trouble quickfix"
    end,
  },
}
