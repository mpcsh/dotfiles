local utils = require("utils")

local colorscheme_modules = {
	["catppuccin"] = "catppuccin/nvim",
	["everforest"] = {
		repo = "sainnhe/everforest",
		before_config = function()
			vim.g.everforest_background = "hard"
		end,
	},
	["gruvbox"] = "ellisonleao/gruvbox.nvim",
	["gruvbox-material"] = "sainnhe/gruvbox-material",
	["nordic"] = "AlexvZyl/nordic.nvim",
	["rose-pine"] = {
		repo = "rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "auto",
			dark_variant = "moon",
			dim_inactive_windows = true,
			extend_background_behind_borders = true,
		},
	},
	["tokyonight"] = "folke/tokyonight.nvim",
}

local function before_config(module)
	vim.opt.termguicolors = true

	if module.before_config ~= nil then
		module.before_config()
	end
end

local function after_config(module)
	-- remove tildes for blank lines
	vim.cmd("hi EndOfBuffer guifg=bg")

	-- italic comments
	vim.cmd("hi Comment gui=italic")

	-- closure highlighting
	vim.cmd("hi LinkDelimiter gui=bold")
	vim.cmd("hi MatchParen gui=bold")

	if module.after_config ~= nil then
		module.after_config()
	end
end

local specs = {}
for name, val in pairs(colorscheme_modules) do
	local module
	if type(val) == "string" then
		module = { repo = val }
	else
		module = val
	end

	local spec = { module.repo, name = name }

	if name == utils.default_colorscheme_module then
		spec.lazy = false
		spec.priority = 1000
	else
		spec.lazy = true
	end

	spec.config = function()
		before_config(module)
		if name == utils.default_colorscheme_module then
			vim.cmd("colorscheme " .. utils.default_colorscheme)
		end
		after_config(module)
	end

	table.insert(specs, spec)
end
return specs
