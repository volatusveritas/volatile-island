-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\LUCAS\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\LUCAS\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\LUCAS\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\LUCAS\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\LUCAS\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["JABS.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tjabs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\JABS.nvim",
    url = "https://github.com/matbme/JABS.nvim"
  },
  ["bookmarks.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14bookmarks\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\bookmarks.nvim",
    url = "https://github.com/volatusveritas/bookmarks.nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n¦\3\0\0\a\0\29\0/6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\n\0005\3\a\0004\4\0\0=\4\b\0034\4\0\0=\4\t\3=\3\v\0025\3\21\0005\4\17\0005\5\f\0004\6\0\0=\6\r\0054\6\0\0=\6\14\0054\6\0\0=\6\15\0054\6\0\0=\6\16\5=\5\18\0045\5\19\0004\6\0\0=\6\r\0054\6\0\0=\6\14\0054\6\0\0=\6\15\0054\6\0\0=\6\16\5=\5\20\4=\4\22\3=\3\23\0025\3\26\0005\4\24\0004\5\0\0=\5\25\4=\4\27\3=\3\28\2B\0\2\1K\0\1\0\22custom_highlights\16TSParameter\1\0\0\nstyle\1\0\0\17integrations\15native_lsp\1\0\0\15underlines\1\0\0\17virtual_text\1\0\0\16information\rwarnings\nhints\verrors\1\0\0\vstyles\1\0\0\17conditionals\rcomments\1\0\0\nsetup\15catppuccin\frequire\nmocha\23catppuccin_flavour\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  ["coq.thirdparty"] = {
    config = { "\27LJ\2\n_\0\0\4\0\3\0\b6\0\0\0'\2\1\0B\0\2\0024\2\3\0005\3\2\0>\3\1\2B\0\2\1K\0\1\0\1\0\3\14shot_name\tnLUA\14conf_only\2\bsrc\fnvimlua\vcoq_3p\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coq.thirdparty",
    url = "https://github.com/ms-jpq/coq.thirdparty"
  },
  coq_nvim = {
    after = { "mason-lspconfig.nvim" },
    config = { "\27LJ\2\n¬\1\0\0\4\0\f\0\0146\0\0\0009\0\1\0005\1\3\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\2=\2\t\1=\1\2\0006\0\n\0'\2\v\0B\0\2\1K\0\1\0\bcoq\frequire\fdisplay\fpreview\1\0\1\vborder\frounded\bpum\1\0\0\1\0\1\15fast_close\1\1\0\1\15auto_start\fshut-up\17coq_settings\6g\bvim\0" },
    loaded = true,
    only_config = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugconfig.feline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  gruvbox = {
    config = { "\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\tsoft\26gruvbox_contrast_dark\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nw\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0*indent_blankline_show_current_context$indent_blankline_use_treesitter\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\nO\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\26use_extended_mappings\22kommentary.config\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugconfig.lspconfig\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neorg = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugconfig.neorg\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["nord.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\bset\tnord\frequire\16nord_italic\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nr\0\0\3\0\a\0\v6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\rcss,html\28colorizer_auto_filetype\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n–\2\0\0\a\0\16\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\r\0005\4\v\0004\5\3\0005\6\n\0>\6\1\5=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\tview\rmappings\1\0\0\tlist\1\0\0\1\0\2\bkey\t<CR>\vaction\18edit_in_place\rrenderer\19indent_markers\1\0\0\1\0\1\venable\2\23hijack_directories\1\0\1\venable\2\1\0\2\23sync_root_with_cwd\2\17hijack_netrw\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugconfig.nvim-treesitter\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\nb\0\0\3\0\6\0\a6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\1=\1\2\0K\0\1\0\15code_style\1\0\1\rcomments\tnone\1\0\1\nstyle\tdark\19onedark_config\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  onehalf = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onehalf\\vim",
    url = "https://github.com/sonph/onehalf"
  },
  ["overseer.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugconfig.overseer\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\overseer.nvim",
    url = "https://github.com/stevearc/overseer.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persistence.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16persistence\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\persistence.nvim",
    url = "https://github.com/folke/persistence.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\vneovim\24presence_main_image\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  tagbar = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\21tagbar_autofocus\6g\bvim\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ["telescope-emoji.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\nemoji\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-emoji.nvim",
    url = "https://github.com/xiyaowong/telescope-emoji.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugconfig.toggleterm\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\twilight.nvim",
    url = "https://github.com/benstockil/twilight.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-godot"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-godot",
    url = "https://github.com/habamax/vim-godot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["volatile-org.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17volatile-org\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\volatile-org.nvim",
    url = "https://github.com/volatusveritas/volatile-org.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["workspaces.nvim"] = {
    config = { "\27LJ\2\ni\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\nsetup\15workspaces\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\workspaces.nvim",
    url = "https://github.com/natecraddock/workspaces.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nW\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\nwidth\3`\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",C:\\Users\\LUCAS\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onehalf\\vim"
time([[Runtimepath customization]], false)
local module_lazy_loads = {
  ["^persistence"] = "persistence.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nr\0\0\3\0\a\0\v6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14colorizer\frequire\rcss,html\28colorizer_auto_filetype\6g\bvim\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\26use_extended_mappings\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: JABS.nvim
time([[Config for JABS.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tjabs\frequire\0", "config", "JABS.nvim")
time([[Config for JABS.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0*indent_blankline_show_current_context$indent_blankline_use_treesitter\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\vneovim\24presence_main_image\6g\bvim\0", "config", "presence.nvim")
time([[Config for presence.nvim]], false)
-- Config for: volatile-org.nvim
time([[Config for volatile-org.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17volatile-org\frequire\0", "config", "volatile-org.nvim")
time([[Config for volatile-org.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n–\2\0\0\a\0\16\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0025\3\r\0005\4\v\0004\5\3\0005\6\n\0>\6\1\5=\5\f\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\tview\rmappings\1\0\0\tlist\1\0\0\1\0\2\bkey\t<CR>\vaction\18edit_in_place\rrenderer\19indent_markers\1\0\0\1\0\1\venable\2\23hijack_directories\1\0\1\venable\2\1\0\2\23sync_root_with_cwd\2\17hijack_netrw\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31plugconfig.nvim-treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: bookmarks.nvim
time([[Config for bookmarks.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14bookmarks\frequire\0", "config", "bookmarks.nvim")
time([[Config for bookmarks.nvim]], false)
-- Config for: telescope-emoji.nvim
time([[Config for telescope-emoji.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\nemoji\19load_extension\14telescope\frequire\0", "config", "telescope-emoji.nvim")
time([[Config for telescope-emoji.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugconfig.neorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: workspaces.nvim
time([[Config for workspaces.nvim]], true)
try_loadstring("\27LJ\2\ni\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\1K\0\1\0\19load_extension\14telescope\nsetup\15workspaces\frequire\0", "config", "workspaces.nvim")
time([[Config for workspaces.nvim]], false)
-- Config for: tagbar
time([[Config for tagbar]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\21tagbar_autofocus\6g\bvim\0", "config", "tagbar")
time([[Config for tagbar]], false)
-- Config for: coq.thirdparty
time([[Config for coq.thirdparty]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\3\0\b6\0\0\0'\2\1\0B\0\2\0024\2\3\0005\3\2\0>\3\1\2B\0\2\1K\0\1\0\1\0\3\14shot_name\tnLUA\14conf_only\2\bsrc\fnvimlua\vcoq_3p\frequire\0", "config", "coq.thirdparty")
time([[Config for coq.thirdparty]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\3\0\6\0\a6\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\1=\1\2\0K\0\1\0\15code_style\1\0\1\rcomments\tnone\1\0\1\nstyle\tdark\19onedark_config\6g\bvim\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\nwidth\3`\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n¦\3\0\0\a\0\29\0/6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\n\0005\3\a\0004\4\0\0=\4\b\0034\4\0\0=\4\t\3=\3\v\0025\3\21\0005\4\17\0005\5\f\0004\6\0\0=\6\r\0054\6\0\0=\6\14\0054\6\0\0=\6\15\0054\6\0\0=\6\16\5=\5\18\0045\5\19\0004\6\0\0=\6\r\0054\6\0\0=\6\14\0054\6\0\0=\6\15\0054\6\0\0=\6\16\5=\5\20\4=\4\22\3=\3\23\0025\3\26\0005\4\24\0004\5\0\0=\5\25\4=\4\27\3=\3\28\2B\0\2\1K\0\1\0\22custom_highlights\16TSParameter\1\0\0\nstyle\1\0\0\17integrations\15native_lsp\1\0\0\15underlines\1\0\0\17virtual_text\1\0\0\16information\rwarnings\nhints\verrors\1\0\0\vstyles\1\0\0\17conditionals\rcomments\1\0\0\nsetup\15catppuccin\frequire\nmocha\23catppuccin_flavour\6g\bvim\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\tsoft\26gruvbox_contrast_dark\6g\bvim\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugconfig.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: overseer.nvim
time([[Config for overseer.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugconfig.overseer\frequire\0", "config", "overseer.nvim")
time([[Config for overseer.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nord.nvim
time([[Config for nord.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\6\0\n6\0\0\0009\0\1\0+\1\1\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\bset\tnord\frequire\16nord_italic\6g\bvim\0", "config", "nord.nvim")
time([[Config for nord.nvim]], false)
-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
try_loadstring("\27LJ\2\n¬\1\0\0\4\0\f\0\0146\0\0\0009\0\1\0005\1\3\0005\2\5\0005\3\4\0=\3\6\0025\3\a\0=\3\b\2=\2\t\1=\1\2\0006\0\n\0'\2\v\0B\0\2\1K\0\1\0\bcoq\frequire\fdisplay\fpreview\1\0\1\vborder\frounded\bpum\1\0\0\1\0\1\15fast_close\1\1\0\1\15auto_start\fshut-up\17coq_settings\6g\bvim\0", "config", "coq_nvim")
time([[Config for coq_nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugconfig.feline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd mason-lspconfig.nvim ]]

-- Config for: mason-lspconfig.nvim
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugconfig.lspconfig\frequire\0", "config", "mason-lspconfig.nvim")

time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'persistence.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
