local impatient_ok, impatient = pcall(require, "impatient")



if impatient_ok then impatient.enable_profile() end

for _, source in ipairs {
  "core.utils",
  "core.options",
  "core.bootstrap",
  "core.plugins",
  "core.autocmds",
  "core.mappings",
  "configs.which-key-register",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

astronvim.conditional_func(astronvim.user_plugin_opts("polish", nil, false))

vim.cmd [[

  set whichwrap+=<,>,h,l,[,] "To make left or right arrow key to switch line
  inoremap jj <ESC>
  inoremap <delete> <backspace>
  set mouse=
  set clipboard=unnamedplus
  " nnoremap <C-x> :hi normal guibg=00000 <CR>  
  


]]

