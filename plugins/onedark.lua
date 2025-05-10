return {
  "navarasu/onedark.nvim",
  config = function()
    require('onedark').setup {
      style = 'dark'
      -- style = 'darker'
      -- style = 'cool'
      -- style = 'deep'
      -- style = 'warm'
      -- style = 'warmer'
    }
    require('onedark').load()
  end
}
