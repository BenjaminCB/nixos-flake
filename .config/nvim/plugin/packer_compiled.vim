" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  Colorizer = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/Colorizer"
  },
  ale = {
    loaded = false,
    needs_bufread = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/opt/ale"
  },
  badwolf = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/badwolf"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/cheat.sh-vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lualine.nvim"] = {
    config = { "require('bcb.lualine')" },
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nvim-compe"] = {
    config = { "require('bcb.compe')" },
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "require('bcb.lsp')" },
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('bcb.telescope')" },
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-closer"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/vim-closer"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  vimsence = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/vimsence"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

-- Config for: telescope.nvim
require('bcb.telescope')
-- Config for: nvim-lspconfig
require('bcb.lsp')
-- Config for: nvim-compe
require('bcb.compe')
-- Config for: lualine.nvim
require('bcb.lualine')
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'ale'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType haskell ++once lua require("packer.load")({'ale'}, { ft = "haskell" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'ale'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'ale'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
vim.cmd [[source /home/bcb/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
