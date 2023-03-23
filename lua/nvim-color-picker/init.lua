function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function grab_color()
  local handle = io.popen('zenity --color-selection')
  local result = handle:read("*a")
  handle:close()
  print(result)
  vim.api.nvim_set_current_line(result)
end

function ConvertToHex(color) -- Converts RGB colors to HEX
	local hex = {}

	for rgb in color:gmatch('%d+') do
		table.insert(hex, ('%02X'):format(tonumber(rgb)))
	end

	return table.concat(hex)
end

--map("n", "<C-G>", ":lua os.execute('zenity --color-selection')<cr>", { silent = true })
map("n", "<C-G>", ":lua grab_color()", { silent = true })
