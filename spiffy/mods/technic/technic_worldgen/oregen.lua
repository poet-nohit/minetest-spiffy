-- *** adjusted heights to work around the bedrock being at -256
-- everything is pretty much blobs at this point

local chromium_params = {offset=0.35, scale=0.2, spread = {x=5, y=5, z=5},
		seed=421, octaves=1, persist=0.5}
local chromium_threshhold = 0

local zinc_params = {offset=0.35, scale=0.2, spread = {x=5, y=5, z=5},
		seed=422, octaves=1, persist=0.5}
local zinc_threshhold = 0

local lead_params = {offset=0.35, scale=0.2, spread = {x=5, y=5, z=5},
		seed=423, octaves=1, persist=0.5}
local lead_threshhold = 0

minetest.register_ore({
	ore_type		= "blob",
	ore				= "technic:mineral_chromium",
	wherein			= "default:stone",
	clust_scarcity	= 25*25*25,
	clust_size		= 7,
	y_min			= -127,
	y_max			= -64,
	noise_threshhold	= chromium_threshhold,
	noise_params		= chromium_params,
})

minetest.register_ore({
	ore_type		= "blob",
	ore				= "technic:mineral_chromium",
	wherein			= "default:stone",
	clust_scarcity	= 24*24*24,
	clust_size		= 7,
	y_min			= -300,
	y_max			= -128,
	noise_threshhold	= chromium_threshhold,
	noise_params		= chromium_params,
})

minetest.register_ore({
	ore_type		= "blob",
	ore				= "technic:mineral_zinc",
	wherein			= "default:stone",
	clust_scarcity	= 25*25*25,
	clust_size		= 9,
	y_min			= -32,
	y_max			= 2,
	noise_threshhold	= zinc_threshhold,
	noise_params		= zinc_params,
})

minetest.register_ore({
	ore_type		= "blob",
	ore				= "technic:mineral_zinc",
	wherein			= "default:stone",
	clust_scarcity	= 24*24*24,
	clust_size		= 8,
	y_min			= -300,
	y_max			= -32,
	noise_threshhold	= zinc_threshhold,
	noise_params		= zinc_params,
})

minetest.register_ore({
	ore_type		= "blob",
	ore				= "technic:mineral_lead",
	wherein			= "default:stone",
	clust_scarcity	= 25*25*25,
	clust_size		= 5,
	y_min			= -16,
	y_max			= 16,
	noise_threshhold	= lead_threshhold,
	noise_params		= lead_params,
})

minetest.register_ore({
	ore_type		= "blob",
	ore				= "technic:mineral_lead",
	wherein			= "default:stone",
	clust_scarcity	= 24*24*24,
	clust_size		= 7,
	y_min			= -127,
	y_max       	= -16,
	noise_threshhold	= lead_threshhold,
	noise_params		= lead_params,
})

minetest.register_ore({
	ore_type		= "blob",
	ore				= "technic:mineral_lead",
	wherein			= "default:stone",
	clust_scarcity	= 23*23*23,
	clust_size		= 9,
	y_min			= -300,
	y_max			= -128,
	noise_threshhold	= lead_threshhold,
	noise_params		= lead_params,
})

-- Sulfur
minetest.register_on_generated(function(minp, maxp, seed)
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local a = VoxelArea:new{
		MinEdge = {x = emin.x, y = emin.y, z = emin.z},
		MaxEdge = {x = emax.x, y = emax.y, z = emax.z},
	}
	local data = vm:get_data()
	local pr = PseudoRandom(17 * minp.x + 42 * minp.y + 101 * minp.z)
	local noise = minetest.get_perlin(9876, 3, 0.5, 100)
	
	local c_lava = minetest.get_content_id("default:lava_source")
	local c_lava_flowing = minetest.get_content_id("default:lava_flowing")
	local c_stone = minetest.get_content_id("default:stone")
	local c_sulfur = minetest.get_content_id("technic:mineral_sulfur")
	
	local grid_size = 5
	for x = minp.x + math.floor(grid_size / 2), maxp.x, grid_size do
	for y = minp.y + math.floor(grid_size / 2), maxp.y, grid_size do
	for z = minp.z + math.floor(grid_size / 2), maxp.z, grid_size do
		local c = data[a:index(x, y, z)]
		if (c == c_lava or c == c_lava_flowing) and noise:get3d({x = x, y = z, z = z}) >= 0.4 then
			for xx = math.max(minp.x, x - grid_size), math.min(maxp.x, x + grid_size) do
			for yy = math.max(minp.y, y - grid_size), math.min(maxp.y, y + grid_size) do
			for zz = math.max(minp.z, z - grid_size), math.min(maxp.z, z + grid_size) do
				local i = a:index(xx, yy, zz)
				if data[i] == c_stone and pr:next(1, 10) <= 7 then
					data[i] = c_sulfur
				end
			end
			end
			end
		end
	end
	end
	end
	
	vm:set_data(data)
	vm:write_to_map(data)
end)


if technic.config:get_bool("enable_marble_generation") then
minetest.register_ore({
	ore_type		= "blob",
	ore				= "technic:marble",
	wherein			= "default:stone",
	clust_scarcity	= 31*31*31,
	clust_size		= 13,
	y_min			= -300,
	y_max			= -20,
	noise_threshhold	= 0,
	noise_params		= {offset=0.35, scale=0.2, spread = {x=5, y=5, z=5},
		seed=23, octaves=1, persist=0.5}
})
end

if technic.config:get_bool("enable_granite_generation") then
minetest.register_ore({
	ore_type		= "blob",
	ore				= "technic:granite",
	wherein			= "default:stone",
	clust_scarcity	= 33*33*33,
	clust_size		= 14,
	y_min			= -300,
	y_max			= -100,
	noise_threshhold	= 0,
	noise_params		= {offset=0.35, scale=0.2, spread = {x=5, y=5, z=5},
		seed=24, octaves=1, persist=0.5}
})
end

-- scatter uranium in whatever stone is left

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "technic:mineral_uranium",
	wherein			= "default:stone",
	clust_scarcity	= 9*9*9,
	clust_num_ores	= 4,
	clust_size		= 3,
	y_min			= -300,
	y_max			= -50,
})
