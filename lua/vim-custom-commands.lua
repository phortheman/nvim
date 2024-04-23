--- Custom commands for things that don't really need a plugin but I may need to do

vim.cmd([[command! CopyRelativePath :call setreg('+', expand('%'))]])
