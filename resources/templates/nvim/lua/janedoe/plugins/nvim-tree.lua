-- file tree
-- shortcuts:
-- * b: tree toggle (open/close explorer)
-- * f: search current file
-- * c: collapse the whole tree (close the tree)
-- * r: refresh (update the file system changes)
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "antosha417/nvim-lsp-file-operations",
  },
  enabled = true,
  config = function()
    require("lsp-file-operations").setup()
    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

    local function natural_cmp(left, right)
      -- Prioritize directories over files.
      if left.type ~= "directory" and right.type == "directory" then
        return false
      elseif left.type == "directory" and right.type ~= "directory" then
        return true
      end

      left = left.name:lower()
      right = right.name:lower()

      if left == right then
        return false
      end

      for i = 1, math.max(string.len(left), string.len(right)), 1 do
        local l = string.sub(left, i, -1)
        local r = string.sub(right, i, -1)

        if type(tonumber(string.sub(l, 1, 1))) == "number" and type(tonumber(string.sub(r, 1, 1))) == "number" then
          local l_number = tonumber(string.match(l, "^[0-9]+"))
          local r_number = tonumber(string.match(r, "^[0-9]+"))

          if l_number ~= r_number then
            return l_number < r_number
          end
        elseif string.sub(l, 1, 1) ~= string.sub(r, 1, 1) then
          return l < r
        end
      end
    end

    require("nvim-tree").setup({
      sort = {
        sorter = function(nodes)
          table.sort(nodes, natural_cmp)
        end,
      },
      view = {
        width = 25,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = ">", -- arrow when folder is closed
              arrow_open = "v", -- arrow when folder is open
            },
          },
           show = {
             file = true,
             folder = true,
             folder_arrow = true,
             git = true,
          --   modified = true,
          --   diagnostics = false,
          --   bookmarks = false,
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        enable = false,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "h",
          info = "i",
          warning = "w",
          error = "e",
        },
      },
    })
    vim.keymap.set("n", "<C-b>", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set(
      "n",
      "<C-f>",
      "<cmd>NvimTreeFindFileToggle<CR>",
      { desc = "Toggle file explorer on current file" }
    )
    vim.keymap.set("n", "<C-c>", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    vim.keymap.set("n", "<C-r>", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end,
}

