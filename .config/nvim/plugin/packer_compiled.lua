-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/bcb/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
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
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/diffview.nvim"
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
  neogit = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/neogit"
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
  ["open-browser.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/opt/open-browser.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plantuml-previewer.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/opt/plantuml-previewer.vim"
  },
  ["plantuml-syntax"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/bcb/.local/share/nvim/site/pack/packer/opt/plantuml-syntax"
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

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('bcb.telescope')
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('bcb.lsp')
time([[Config for nvim-lspconfig]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('bcb.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
require('bcb.compe')
time([[Config for nvim-compe]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'ale'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType plantuml ++once lua require("packer.load")({'plantuml-syntax', 'plantuml-previewer.vim', 'open-browser.vim'}, { ft = "plantuml" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'ale'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'ale'}, { ft = "bash" }, _G.packer_plugins)]]
vim.cmd [[au FileType haskell ++once lua require("packer.load")({'ale'}, { ft = "haskell" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'ale'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType cs ++once lua require("packer.load")({'ale'}, { ft = "cs" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/bcb/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/bcb/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/bcb/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
