-- ~/.config/nvim/lua/user/rocks-installer.lua
-- Conditional rocks.nvim installer for AstroNvim

local M = {}

-- Function to check if rest.nvim is enabled in community.lua
local function is_rest_nvim_enabled()
  local community_path = vim.fn.stdpath("config") .. "/lua/community.lua"

  -- Check if community.lua exists
  if vim.fn.filereadable(community_path) == 0 then
    return false
  end

  -- Read the file content
  local file = io.open(community_path, "r")
  if not file then return false end

  local content = file:read("*all")
  file:close()

  -- Check if the file is disabled (if true then return {} end)
  if content:match("if%s+true%s+then%s+return%s+{}") then
    return false
  end

  -- Check if rest.nvim is present and not commented out
  -- Look for: { import = "astrocommunity.programming-language-support.rest-nvim" }
  local pattern = "astrocommunity%.programming%-language%-support%.rest%-nvim"

  for line in content:gmatch("[^\r\n]+") do
    -- Skip commented lines
    local trimmed = line:match("^%s*(.-)%s*$")
    if not trimmed:match("^%-%-") then
      if trimmed:match(pattern) then
        return true
      end
    end
  end

  return false
end

-- Function to check if rest.nvim is installed
local function is_rest_nvim_installed()
  local lazy_path = vim.fn.stdpath("data") .. "/lazy/rest.nvim"
  return vim.fn.isdirectory(lazy_path) == 1
end

-- Function to install rocks.nvim
local function install_rocks_nvim()
  local rocks_path = vim.fn.stdpath("data") .. "/rocks"

  -- Print the path for reference (equivalent to :lua print(...))
  print("Installing rocks.nvim to: " .. rocks_path)

  -- Create the directory if it doesn't exist
  vim.fn.mkdir(rocks_path, "p")

  -- Construct the luarocks command
  local cmd
  if vim.fn.has("win32") == 1 then
    -- Windows PowerShell command
    cmd = string.format(
      'powershell -Command "$rocks_path = \'%s\'; luarocks --lua-version=5.1 --tree $rocks_path --server=\'https://nvim-neorocks.github.io/rocks-binaries/\' install rocks.nvim"',
      rocks_path
    )
  else
    -- Unix/Linux command
    cmd = string.format(
      "luarocks --lua-version=5.1 --tree '%s' --server='https://nvim-neorocks.github.io/rocks-binaries/' install rocks.nvim",
      rocks_path
    )
  end

  -- Execute the command
  print("Executing: " .. cmd)
  local result = vim.fn.system(cmd)

  if vim.v.shell_error == 0 then
    print("✓ rocks.nvim installed successfully!")
    print("Please restart Neovim to complete the installation.")
  else
    print("✗ Failed to install rocks.nvim:")
    print(result)
  end
end

-- Setup rocks.nvim paths
function M.setup_rocks_paths()
  local rocks_path = vim.fn.stdpath("data") .. "/rocks"
  if vim.fn.isdirectory(rocks_path) == 1 then
    local luarocks_path = {
      vim.fs.joinpath(rocks_path, "share", "lua", "5.1", "?.lua"),
      vim.fs.joinpath(rocks_path, "share", "lua", "5.1", "?", "init.lua"),
    }
    package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

    local luarocks_cpath = {
      vim.fs.joinpath(rocks_path, "lib", "lua", "5.1", "?.so"),
      vim.fs.joinpath(rocks_path, "lib64", "lua", "5.1", "?.so"),
    }
    package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

    vim.g.rocks_nvim = {
      rocks_path = rocks_path,
      luarocks_binary = vim.fn.exepath("luarocks"),
    }
  end
end

-- Main initialization function
function M.init()
  -- Setup paths first (needed even if rocks.nvim is already installed)
  M.setup_rocks_paths()

  -- Check if conditional installation is needed
  if is_rest_nvim_enabled() and not is_rest_nvim_installed() then
    print("rest.nvim detected in community.lua but rest.nvim not installed.")
    print("Installing rocks.nvim (required for rest.nvim)...")

    -- Schedule the installation to run after Neovim starts
    vim.schedule(function()
      install_rocks_nvim()
    end)
  end
end

return M
