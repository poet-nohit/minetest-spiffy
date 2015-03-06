-- *** made bedrock more unbreakable and limited it to above the nether

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "bedrock:bedrock",
	wherein        = "default:stone",
	clust_scarcity = 1,
	clust_num_ores = 5,
	clust_size     = 2,
	height_min     = -4999,
	height_max     = -256,
})

minetest.register_node("bedrock:bedrock", {
	description = "Bedrock",
	tile_images = {"bedrock_bedrock.png"},
	groups = {unbreakable = 1},
	can_dig = function(pos, player)
		return false
	end,
	sounds = default.node_sound_stone_defaults(),
})
