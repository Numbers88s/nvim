local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local command_center_status, command_center = pcall(require, "command_center")
if not command_center_status then
	return
end

local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }

-- general keymaps
command_center.add({
	{
		desc = "Core: Escape insert mode",
		cmd = "<ESC>",
		keys = { "i", "js", noremap },
	},
	{
		desc = "Core: Clear search",
		cmd = "<leader>nh",
		keys = { "n", ":nohl<CR>", noremap },
	},
	{
		desc = "Core: Increment ints",
		cmd = "<leader>+",
		keys = { "n", "<C-a>", noremap },
	},
	{
		desc = "Core: Decrement ints",
		cmd = "<leader>-",
		keys = { "n", "<C-x>", noremap },
	},
	{
		desc = "Core: Find and replace",
		cmd = ":%s@",
	},
})

-- Window Mappings
command_center.add({
	{
		desc = "Window: Split window vertically",
		cmd = "<leader>sv",
		keys = { "n", "<C-w>v", noremap },
	},
	{
		desc = "Window: Split horizontal",
		cmd = "<leader>sh",
		keys = { "n", "<C-w>s", noremap },
	},
	{
		desc = "Window: Split vertical",
		cmd = "<leader>sv",
		keys = { "n", "<C-w>v", noremap },
	},
	{
		desc = "Window: Split equal width",
		cmd = "<leader>se",
		keys = { "n", "<C-w>=", noremap },
	},
	{
		desc = "Window: Close current split window",
		cmd = "<leader>sx",
		keys = { "n", ":close<CR>", noremap },
	},
	{
		desc = "Window: Maximize current window",
		cmd = "<leader>sm",
		keys = { "n", ":MaximizerToggle<CR>", noremap },
	},
})

-- Tabs and Buffers
command_center.add({
	{
		desc = "Tab: Open new tab",
		cmd = "<leader>to",
		keys = { "n", ":tabnew<CR>", noremap },
	},
	{

		desc = "Tab: Close current tab",
		cmd = "<leader>tx",
		keys = { "n", ":tabclose<CR>", noremap },
	},
	{
		desc = "Tab: Next tab",
		cmd = "<leader>tn",
		keys = { "n", ":tabn<CR>", noremap },
	},
	{
		desc = "Tab: Previous tab",
		cmd = "<leader>tp",
		keys = { "n", ":tabp<CR>", noremap },
	},
	{
		desc = "Buffer: Close current buffer",
		cmd = "<leader>w",
		keys = { "n", ":tabclose<CR>", noremap },
	},
})

-- Navigation
command_center.add({
	{
		desc = "Directory: Open directory at current file",
		cmd = "<leader>k",
		keys = { "n", ":NvimTreeToggle<CR>", noremap },
	},
})

-- Telescope
command_center.add({
	{
		desc = "Telescope: Find files",
		cmd = "<leader>ff",
		keys = { "n", "<CMD>Telescope find_files<CR>", noremap },
	},
	{
		desc = "Telescope: Find string",
		cmd = "<leader>fs",
		keys = { "n", "<CMD>Telescope live_grep<CR>", noremap },
	},
	{
		desc = "Telescope: Find string under cursor",
		cmd = "<leader>fg",
		keys = { "n", "<CMD>Telescope grep_string<CR>", noremap },
	},
	{
		desc = "Telescope: Find buffers",
		cmd = "<leader>fk",
		keys = { "n", "<CMD>Telescope buffers<CR>", noremap },
	},
	{
		desc = "Telescope: Fuzzy find current buffer",
		cmd = "<leader>fh",
		keys = { "n", "<CMD>Telescope current_buffer_fuzzy_find<CR>", noremap },
	},
	{
		-- If no keys are specified, no keymaps will be displayed nor set
		desc = "Telescope: Find hidden files",
		cmd = "<CMD>Telescope find_files hidden=true<CR>",
	},
	{
		desc = "Telescope: File Browser",
		cmd = "<leader>fb",
		keys = { "n", ":Telescope file_browser path=%:p:h", noremap },
	},
})

-- Command Center w/ Telescope
command_center.add({
	{
		desc = "Telescope: Open command_center",
		cmd = "<CMD>Telescope command_center<CR>",
		keys = {
			{ "n", "<Leader>fc", noremap },
			{ "v", "<Leader>fc", noremap },
			-- If ever hesitate when using telescope start with <leader>f,
			-- also open command center
			{ "n", "<Leader>f", noremap },
			{ "v", "<Leader>f", noremap },
		},
	},
}, command_center.mode.REGISTER_ONLY)

-- Trouble
command_center.add({
	{
		desc = "Trouble: Open trouble window",
		cmd = "<CMD>TroubleToggle<CR>",
		keys = { "n", "<Leader>=", silent_noremap },
	},
	{
		desc = "Trouble: Open workspace diagnostics",
		cmd = "<CMD>TroubleToggle workspace_diagnostics<CR>",
		keys = { "n", "<Leader>=w", silent_noremap },
	},
	{
		desc = "Trouble: Open document diagnostics",
		cmd = "<CMD>TroubleToggle document_diagnostics<CR>",
		keys = { "n", "<Leader>=d", silent_noremap },
	},
	{
		desc = "Trouble: Open loclist",
		cmd = "<CMD>TroubleToggle loclist<CR>",
		keys = { "n", "<Leader>=l", silent_noremap },
	},
	{
		desc = "Trouble: Open quickfix",
		cmd = "<CMD>TroubleToggle quickfix<CR>",
		keys = { "n", "<Leader>=q", silent_noremap },
	},
	{
		desc = "Trouble: Open lsp_references",
		cmd = "<CMD>TroubleToggle lsp_references<CR>",
		keys = { "n", "<Leader>=r", silent_noremap },
	},
})

-- DAP Debugging
command_center.add({
	{
		desc = "Debug: Start debugging",
		cmd = "<CMD>lua require('dap').continue()<CR>",
		keys = { "n", "<F5>", silent_noremap },
	},
	{
		desc = "Debug: Step over",
		cmd = "<CMD>lua require('dap').step_over()<CR>",
		keys = { "n", "<F8>", silent_noremap },
	},
	{
		desc = "Debug: Step into",
		cmd = "<CMD>lua require('dap').step_into()<CR>",
		keys = { "n", "<F9>", silent_noremap },
	},
	{
		desc = "Debug: Step out",
		cmd = "<CMD>lua require('dap').step_out()<CR>",
		keys = { "n", "<F7>", silent_noremap },
	},
	{
		desc = "Debug: Toggle breakpoint",
		cmd = "<CMD>lua require('dap').toggle_breakpoint()<CR>",
		keys = { "n", "<F6>", silent_noremap },
	},
})

-- Harpoon
command_center.add({
	{
		desc = "Harpoon: Toggle harpoon",
		cmd = "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>",
		keys = { "n", "<Leader>h", silent_noremap },
	},
	{
		desc = "Harpoon: Add file to harpoon",
		cmd = "<CMD>lua require('harpoon.mark').add_file()<CR>",
		keys = { "n", "<Leader>ha", silent_noremap },
	},
	{
		desc = "Harpoon: Navigate to file 1",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(1)<CR>",
		keys = { "n", "1", silent_noremap },
	},
	{
		desc = "Harpoon: Navigate to file 2",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(2)<CR>",
		keys = { "n", "2", silent_noremap },
	},
	{
		desc = "Harpoon: Navigate to file 3",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(3)<CR>",
		keys = { "n", "3", silent_noremap },
	},
	{
		desc = "Harpoon: Navigate to file 4",
		cmd = "<CMD>lua require('harpoon.ui').nav_file(4)<CR>",
		keys = { "n", "4", silent_noremap },
	},
})

-- Cokeline
command_center.add({
	{
		desc = "Cokeline: Focus Previous",
		cmd = "<Plug>(cokeline-focus-prev)",
		keys = { "n", "<S-Tab>", silent_noremap },
	},
	{
		desc = "Cokeline: Focus Next",
		cmd = "<Plug>(cokeline-focus-next)",
		keys = { "n", "<Tab>", silent_noremap },
	},
	{
		desc = "Cokeline: Switch Previous",
		cmd = "<Plug>(cokeline-switch-prev)",
		keys = { "n", "<Leader>p", silent_noremap },
	},
	{
		desc = "Cokeline: Switch Next",
		cmd = "<Plug>(cokeline-switch-next)",
		keys = { "n", "<Leader>n", silent_noremap },
	},
})

-- Nvim Tree
command_center.add({
	{
		desc = "Nvim Tree: Toggle Nvim Tree",
		cmd = "<CMD>NvimTreeToggle<CR>",
		keys = { "n", "<Leader>k", silent_noremap },
	},
})

telescope.load_extension("command_center")
