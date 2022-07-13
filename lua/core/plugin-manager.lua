local M = {}

M.bootstrap = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'  

  if fn.empty(fn.glob(install_path)) > 0 then
    print "Cloning packer .."
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    require("plugins")
    vim.cmd "PackerSync"
  end
end

-- See `:h packer-configuration`
M.options = {
  display = {
    -- Use a floating window for command outputs
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

M.load_plugins = function(plugins)
  local present, packer = pcall(require, "packer")
  if not present then
    return
  end

  packer.init(M.options)

  packer.startup(function(use)
    for _, v in pairs(plugins) do
      use(v)
    end
  end)
end

return M
