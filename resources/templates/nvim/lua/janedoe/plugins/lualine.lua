-- statusline
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function cursor_char_info()
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local line = vim.api.nvim_get_current_line()
        local c = line:sub(col + 1, col + 1)

        if c == "" then
          return ""
        end

        local byte = string.byte(c)
        if not byte then
          return ""
        end

        return string.format(" Chr:%s  Dec:%d  Hex:%02X", c, byte, byte)
      end
      -- fileformat
      local function fileformat_text()
        return vim.bo.fileformat
      end

      require("lualine").setup({
        options = {
          theme = "auto",
          icons_enabled = true,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {
            cursor_char_info,
            "encoding",
            fileformat_text,
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}

