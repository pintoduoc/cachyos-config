return {
  {
    "denialofsandwich/sudo.nvim",
    cmd = { "SudoRead", "SudoWrite", "SudoEdit" },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- Bring up the built-in commands automatically
      commands = true, 
    },
  },
}
