local MiniPick = require("mini.pick")
local MiniVisits = require("mini.visits")
---@diagnostic disable: undefined-global
local vim = vim


-- TODO: maybe improve algo performance for large codebases?
MiniPick.registry.omnibar = function()
	local inf = math.huge

	local sort = MiniVisits.gen_sort.z()
	local visit_paths = MiniVisits.list_paths(nil, { sort = sort })
	visit_paths = vim.tbl_map(function(path) return vim.fn.fnamemodify(path, ":.") end, visit_paths)
	local scores = {}
	for idx, path in ipairs(visit_paths) do
	    scores[path] = idx
	end

	-- current file last
	local current_file = vim.fn.expand("%:.")
	if scores[current_file] then
	    scores[current_file] = inf
	end

	MiniPick.builtin.files(nil, {
		source = {
			name = "Omnibar",
			match = function(stritems, indices, query)
				local filtered = MiniPick.default_match(stritems, indices, query, { sync = true }) or {}

				table.sort(filtered, function(item1, item2)
					local path1 = stritems[item1]
					local path2 = stritems[item2]
					local score1 = scores[path1] or inf
					local score2 = scores[path2] or inf

					return score1 < score2
				end)

				return filtered
			end,
		},
	})

end
