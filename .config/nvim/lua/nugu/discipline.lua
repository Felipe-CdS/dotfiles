local M = {}

function M.cowboy()
	---@type table?
	local id
	local ok = true
	for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
		local count = 0
		local timer = assert(vim.loop.new_timer())
		local map = key
		vim.keymap.set("n", key, function()
			--This if statement doesn't make sense? TODO: Study why this is here
			--[[if vim.v.count > 0 then
				count = 0
			end]]
			if count >= 10 then
				--Third argument with icon, replace and keep are just used in @rcarriga/nvim-notify
				--that isn´t installed by default neither here....
				--[[ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
					icon = "🤠",
					replace = id,
					keep = function()
						return count >= 10
					end,
				})
				if not ok then
					id = nil
					return map
				end]]
				pcall(vim.notify, "Calma, filho da puta!", vim.log.levels.WARN)
			else
				count = count + 1
				timer:start(2000, 0, function()
					count = 0
				end)
				return map
			end
		end, { expr = true, silent = true })
	end
end

return M
