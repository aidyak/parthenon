if vim.g.loaded_parthenon then
	return
end
vim.g.loaded_parthenon = true

vim.api.nvim_create_user_command("Parthenon", function()
	require("parthenon").pick()
end, {})
