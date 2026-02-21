local M = {}

M.schemes = {}

local default_keys = {
	pick = "<leader>tc",
}

function M.setup(opts)
	opts = opts or {}
	M.schemes = opts.schemes or {}

	local keys = vim.tbl_extend("force", default_keys, opts.keys or {})

	if keys.pick then
		vim.keymap.set("n", keys.pick, M.pick, { desc = "Pick colorscheme" })
	end
end

local function notify_colorscheme(choice, ok)
	if ok then
		vim.notify("colorscheme: " .. choice, vim.log.levels.INFO)
	else
		vim.notify("colorscheme failed: " .. choice, vim.log.levels.WARN)
	end
end

function M.pick()
	if #M.schemes == 0 then
		vim.notify("colorscheme list is empty", vim.log.levels.WARN)
		return
	end

	local current = vim.g.colors_name

	if vim.ui and vim.ui.select then
		vim.ui.select(M.schemes, { prompt = "Select colorscheme", default = current }, function(choice)
			if not choice then
				return
			end
			local ok = pcall(vim.cmd.colorscheme, choice)
			notify_colorscheme(choice, ok)
		end)
		return
	end

	local choices = { "Select colorscheme" }
	for _, name in ipairs(M.schemes) do
		table.insert(choices, name)
	end

	local idx = vim.fn.inputlist(choices)
	local choice = M.schemes[idx]
	if not choice then
		return
	end

	local ok = pcall(vim.cmd.colorscheme, choice)
	notify_colorscheme(choice, ok)
end

return M
