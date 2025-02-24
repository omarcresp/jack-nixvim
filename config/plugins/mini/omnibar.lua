local MiniPick = require("mini.pick")
local MiniVisits = require("mini.visits")

-- TODO: maybe improve algo performance for large codebases?
MiniPick.registry.omnibar = function()
	local inf = math.huge

	local sort = MiniVisits.gen_sort.z()
	local visit_paths = MiniVisits.list_paths(nil, { sort = sort })
	visit_paths = vim.tbl_map(function(path) return vim.fn.fnamemodify(path, ":.") end, visit_paths)
	vim.tbl_add_reverse_lookup(visit_paths)

	-- current file last
	local current_file = vim.fn.expand("%:.")
	if visit_paths[current_file] then
		visit_paths[current_file] = inf
	end

	MiniPick.builtin.files(nil, {
		source = {
			name = "Omnibar",
			match = function(stritems, indices, query)
				local filtered = MiniPick.default_match(stritems, indices, query, { sync = true }) or {}

				table.sort(filtered, function(item1, item2)
					local path1 = stritems[item1]
					local path2 = stritems[item2]
					local score1 = visit_paths[path1] or inf
					local score2 = visit_paths[path2] or inf

					return score1 < score2
				end)

				return filtered
			end,
		},
	})

end
