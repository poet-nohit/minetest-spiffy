-- Minetest 0.4 Mod: Nether

-- *** changed portals to use x/10 rather than random
-- kept ores in the netherrack, and made rack less annoying
-- changed how portals are built

local NETHER_DEPTH = -5000
local BEDROCK = -256

minetest.register_node("nether:portal", {
	description = "Nether Portal",
	tiles = {
		"nether_transparent.png",
		"nether_transparent.png",
		"nether_transparent.png",
		"nether_transparent.png",
		{
			name = "nether_portal.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "nether_portal.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = true,
	walkable = false,
	digable = false,
	pointable = false,
	buildable_to = false,
	drop = "",
	light_source = 5,
	post_effect_color = {a=180, r=128, g=0, b=128},
	alpha = 192,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1,  0.5, 0.5, 0.1},
		},
	},
	groups = {not_in_creative_inventory=1}
})

local function build_portal(pos, target)
	local p = {x=pos.x-1, y=pos.y-1, z=pos.z}
	local p1 = {x=pos.x-1, y=pos.y-1, z=pos.z}
	local p2 = {x=p1.x+3, y=p1.y+4, z=p1.z}
	for i=1,4 do
		minetest.set_node(p, {name="default:obsidian"})
		p.y = p.y+1
	end
	for i=1,3 do
		minetest.set_node(p, {name="default:obsidian"})
		p.x = p.x+1
	end
	for i=1,4 do
		minetest.set_node(p, {name="default:obsidian"})
		p.y = p.y-1
	end
	for i=1,3 do
		minetest.set_node(p, {name="default:obsidian"})
		p.x = p.x-1
		if i ~= 3 then
			minetest.set_node({x=p.x,y=p.y,z=p.z-2}, {name="nether:brick"})
			minetest.set_node({x=p.x,y=p.y,z=p.z-1}, {name="nether:brick"})
			minetest.set_node({x=p.x,y=p.y,z=p.z+1}, {name="nether:brick"})
			minetest.set_node({x=p.x,y=p.y,z=p.z+2}, {name="nether:brick"})
		end
	end
	for x=p1.x,p2.x do
	for y=p1.y,p2.y do
		p = {x=x, y=y, z=p1.z}
		if not (x == p1.x or x == p2.x or y==p1.y or y==p2.y) then
			minetest.set_node(p, {name="nether:portal", param2=0})
		end
		local meta = minetest.get_meta(p)
		meta:set_string("p1", minetest.pos_to_string(p1))
		meta:set_string("p2", minetest.pos_to_string(p2))
		meta:set_string("target", minetest.pos_to_string(target))
		
		if y ~= p1.y then
			for z=-2,2 do
				if z ~= 0 then
					p.z = p.z+z
					if minetest.registered_nodes[minetest.get_node(p).name].is_ground_content then
						minetest.remove_node(p)
					end
					p.z = p.z-z
				end
			end
		end
		
	end
	end
end

minetest.register_abm({
	nodenames = {"nether:portal"},
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32, --amount
			4, --time
			{x=pos.x-0.25, y=pos.y-0.25, z=pos.z-0.25}, --minpos
			{x=pos.x+0.25, y=pos.y+0.25, z=pos.z+0.25}, --maxpos
			{x=-0.8, y=-0.8, z=-0.8}, --minvel
			{x=0.8, y=0.8, z=0.8}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"nether_particle.png" --texture
		)
		for _,obj in ipairs(minetest.get_objects_inside_radius(pos, 1)) do
			if obj:is_player() then
				local meta = minetest.get_meta(pos)
				local target = minetest.string_to_pos(meta:get_string("target"))
				if target then

					minetest.after(2, function(obj, pos)

						local meta = minetest.get_meta(pos)
						local p1 = minetest.string_to_pos(meta:get_string("p1"))
						local p2 = minetest.string_to_pos(meta:get_string("p2"))
						local target = minetest.string_to_pos(meta:get_string("target"))

						-- still in portal?
						local objpos = obj:getpos()
						objpos.y = objpos.y+0.1 -- Fix some glitches at -8000
						if minetest.get_node(objpos).name ~= "nether:portal" then
							return
						end

						-- go
						obj:setpos(target)
					end, obj, pos, target)

				end
			end
		end
	end,
})

local function move_check(p1, max, dir)
	local p = {x=p1.x, y=p1.y, z=p1.z}
	local d = math.abs(max-p1[dir]) / (max-p1[dir])
	while p[dir] ~= max do
		p[dir] = p[dir] + d
		if minetest.get_node(p).name ~= "default:obsidian" then
			return false
		end
	end
	return true
end

local function check_portal(p1, p2)
	if p1.x ~= p2.x then
		if not move_check(p1, p2.x, "x") then
			return false
		end
		if not move_check(p2, p1.x, "x") then
			return false
		end
	elseif p1.z ~= p2.z then
		if not move_check(p1, p2.z, "z") then
			return false
		end
		if not move_check(p2, p1.z, "z") then
			return false
		end
	else
		return false
	end
	
	if not move_check(p1, p2.y, "y") then
		return false
	end
	if not move_check(p2, p1.y, "y") then
		return false
	end
	
	return true
end

local function is_portal(pos)
	for d=-3,3 do
		for y=-4,4 do
			local px = {x=pos.x+d, y=pos.y+y, z=pos.z}
			local pz = {x=pos.x, y=pos.y+y, z=pos.z+d}
			if check_portal(px, {x=px.x+3, y=px.y+4, z=px.z}) then
				return px, {x=px.x+3, y=px.y+4, z=px.z}
			end
			if check_portal(pz, {x=pz.x, y=pz.y+4, z=pz.z+3}) then
				return pz, {x=pz.x, y=pz.y+4, z=pz.z+3}
			end
		end
	end
end

local function make_portal(pos, placer)
	local p1, p2 = is_portal(pos)
	if not p1 or not p2 then
		return false
	end
	
	for d=1,2 do
	for y=p1.y+1,p2.y-1 do
		local p
		if p1.z == p2.z then
			p = {x=p1.x+d, y=y, z=p1.z}
		else
			p = {x=p1.x, y=y, z=p1.z+d}
		end
		if minetest.get_node(p).name ~= "air" then
			return false
		end
	end
	end
	
	local param2
	if p1.z == p2.z then param2 = 0 else param2 = 1 end
	
	local target = {x=p1.x, y=p1.y, z=p1.z}
	target.x = target.x + 1
	if target.y < NETHER_DEPTH then
		-- going to the overworld
		if math.abs(target.x) < 3000 then
			target.x = target.x * 10
		end
		target.y = (target.y - NETHER_DEPTH) + 1000
		if math.abs(target.y) < 3000 then
			target.y = target.y * 10
		end
		if target.y <= BEDROCK then target.y = BEDROCK+1 end
		if math.abs(target.z) < 3000 then
			target.z = target.z * 10
		end
	else
		-- going to the nether
		target.x = math.floor(target.x / 10)
		target.y = math.floor(target.y / 10)
		target.y = (target.y + NETHER_DEPTH) - 1000
		if target.y > NETHER_DEPTH then target.y = NETHER_DEPTH end
		target.z = math.floor(target.z / 10)
	end

	-- wait for the portal to actually get built, then return
	local function wait_for_portal(pos, target, placer, ret)
		local n = minetest.get_node_or_nil(target)
		if n then
			build_portal(target, pos)
			placer:set_physics_override({gravity=1})
			placer:setpos(ret)
		else
			minetest.after(1, wait_for_portal, pos, target, placer, ret)
		end
	end

	-- *** load the target chunks and build the portal at this point
	local ret = placer:getpos()
	placer:set_physics_override({gravity=0})
	placer:setpos(target)
	minetest.after(1, wait_for_portal, pos, target, placer, ret)

	for d=0,3 do
	for y=p1.y,p2.y do
		local p = {}
		if param2 == 0 then p = {x=p1.x+d, y=y, z=p1.z} else p = {x=p1.x, y=y, z=p1.z+d} end
		if minetest.get_node(p).name == "air" then
			minetest.set_node(p, {name="nether:portal", param2=param2})
		end

		local meta = minetest.get_meta(p)
		meta:set_string("p1", minetest.pos_to_string(p1))
		meta:set_string("p2", minetest.pos_to_string(p2))
		meta:set_string("target", minetest.pos_to_string(target))
	end
	end

	return true
end

minetest.register_node(":default:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},
	
	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local p1 = minetest.string_to_pos(meta:get_string("p1"))
		local p2 = minetest.string_to_pos(meta:get_string("p2"))
		local target = minetest.string_to_pos(meta:get_string("target"))
		if not p1 or not p2 then
			return
		end
		for x=p1.x,p2.x do
		for y=p1.y,p2.y do
		for z=p1.z,p2.z do
			local nn = minetest.get_node({x=x,y=y,z=z}).name
			if nn == "default:obsidian" or nn == "nether:portal" then
				if nn == "nether:portal" then
					minetest.remove_node({x=x,y=y,z=z})
				end
				local m = minetest.get_meta({x=x,y=y,z=z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end
		meta = minetest.get_meta(target)
		if not meta then
			return
		end
		p1 = minetest.string_to_pos(meta:get_string("p1"))
		p2 = minetest.string_to_pos(meta:get_string("p2"))
		if not p1 or not p2 then
			return
		end
		for x=p1.x,p2.x do
		for y=p1.y,p2.y do
		for z=p1.z,p2.z do
			local nn = minetest.get_node({x=x,y=y,z=z}).name
			if nn == "default:obsidian" or nn == "nether:portal" then
				if nn == "nether:portal" then
					minetest.remove_node({x=x,y=y,z=z})
				end
				local m = minetest.get_meta({x=x,y=y,z=z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end
	end,
})

minetest.register_craftitem(":default:mese_crystal_fragment", {
	description = "Mese Crystal Fragment",
	inventory_image = "default_mese_crystal_fragment.png",
	on_place = function(stack, placer, pt)
		if pt.under and minetest.get_node(pt.under).name == "default:obsidian" then
			local done = make_portal(pt.under, placer)
			if done and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
			end
		end
		return stack
	end,
})

minetest.register_node("nether:rack", {
	description = "Netherrack",
	tiles = {"nether_rack.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:sand", {
	description = "Nethersand",
	tiles = {"nether_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3,falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.45},
	}),
})

minetest.register_node("nether:glowstone", {
	description = "Glowstone",
	tiles = {"nether_glowstone.png"},
	is_ground_content = true,
	light_source = 13,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("nether:brick", {
	description = "Nether Brick",
	tiles = {"nether_brick.png"},
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:rack_with_iron", {
	description = "Iron Ore",
	tiles = {"nether_rack.png^default_mineral_iron.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'default:iron_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:rack_with_copper", {
	description = "Copper Ore",
	tiles = {"nether_rack.png^default_mineral_copper.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'default:copper_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:rack_with_mese", {
	description = "Mese Ore",
	tiles = {"nether_rack.png^default_mineral_mese.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:rack_with_gold", {
	description = "Gold Ore",
	tiles = {"nether_rack.png^default_mineral_gold.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:rack_with_diamond", {
	description = "Diamond Ore",
	tiles = {"nether_rack.png^default_mineral_diamond.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "nether:brick",
	wherein        = "default:stone",
	clust_scarcity = 3*3*3,
	clust_num_ores = 10,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = NETHER_DEPTH,
})

local air = minetest.get_content_id("air")
local stone_with_coal = minetest.get_content_id("default:stone_with_coal")
local stone_with_iron = minetest.get_content_id("default:stone_with_iron")
local stone_with_mese = minetest.get_content_id("default:stone_with_mese")
local stone_with_diamond = minetest.get_content_id("default:stone_with_diamond")
local stone_with_gold = minetest.get_content_id("default:stone_with_gold")
local stone_with_copper = minetest.get_content_id("default:stone_with_copper")
local rack_with_iron = minetest.get_content_id("nether:rack_with_iron")
local rack_with_mese = minetest.get_content_id("nether:rack_with_mese")
local rack_with_diamond = minetest.get_content_id("nether:rack_with_diamond")
local rack_with_gold = minetest.get_content_id("nether:rack_with_gold")
local rack_with_copper = minetest.get_content_id("nether:rack_with_copper")
local gravel = minetest.get_content_id("default:gravel")
local dirt = minetest.get_content_id("default:dirt")
local sand = minetest.get_content_id("default:sand")
local lava_source = minetest.get_content_id("default:lava_source")
local lava_flowing = minetest.get_content_id("default:lava_flowing")
local glowstone = minetest.get_content_id("nether:glowstone")
local nethersand = minetest.get_content_id("nether:sand")
local netherbrick = minetest.get_content_id("nether:brick")
local netherrack = minetest.get_content_id("nether:rack")

-- *** some code "borrowed" from subterrain mod

-- Parameters

local YMIN = NETHER_DEPTH-1080 -- Cave realm limits
local YMAX = NETHER_DEPTH-936
local TCAVE = 0 -- Cave threshold. 1 = small rare caves, 0.5 = 1/3rd ground volume, 0 = 1/2 ground volume
local BLEND = 16 -- Cave blend distance near YMIN, YMAX

local YLAVA = NETHER_DEPTH-1064  -- *** lava lake here and lower
local YLMAX = NETHER_DEPTH-1048  -- start lava here

-- 3D noise for caves

local np_cave = {
	offset = 0,
	scale = 1,
	spread = {x=150, y=50, z=150},
	seed = 59033,
	octaves = 6,
	persist = 0.63
}

-- stuff

local yblmin = YMIN + BLEND * 1.5
local yblmax = YMAX - BLEND * 1.5

-- on gen

minetest.register_on_generated(function(minp, maxp, seed)
	if maxp.y > NETHER_DEPTH then
		return
	end

	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local data = vm:get_data()
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}

	local sidelen = x1 - x0 + 1
	local chulens = {x=sidelen, y=sidelen, z=sidelen}
	local minposxyz = {x=x0, y=y0, z=z0}
	
	local nvals_cave = minetest.get_perlin_map(np_cave, chulens):get3dMap_flat(minposxyz)
	
	local nixyz = 1
	for z = z0, z1 do -- for each xy plane progressing northwards
		for y = y0, y1 do -- for each x row progressing upwards
			local tcave
			if y < yblmin then
				tcave = TCAVE + ((yblmin - y) / BLEND) ^ 2
			elseif y > yblmax then
				tcave = TCAVE + ((y - yblmax) / BLEND) ^ 2
			else
				tcave = TCAVE
			end
			local vi = area:index(x0, y, z)
			for x = x0, x1 do -- for each node do
				if nvals_cave[nixyz] > tcave then
					-- *** lava lake
					if y <= YLAVA then
						data[vi] = lava_source
					else
						data[vi] = air
					end
				end
				-- *** change something to lava
				local d = data[vi]
				if y <= YLMAX and y > YLAVA then
					if d == gravel then
						data[vi] = lava_source
						d = lava_source
					end
				end
				if d == air or d == netherbrick then
					-- do nothing
				elseif d == stone_with_coal then
					data[vi] = glowstone
				elseif d == stone_with_iron then
					data[vi] = rack_with_iron
				elseif d == stone_with_mese then
					data[vi] = rack_with_mese
				elseif d == stone_with_diamond then
					data[vi] = rack_with_diamond
				elseif d == stone_with_gold then
					data[vi] = rack_with_gold
				elseif d == stone_with_copper then
					data[vi] = rack_with_copper
				elseif d == lava_source or d == lava_flowing then
					-- nothing
				elseif d == gravel or d == dirt or d == sand then
					data[vi] = nethersand
				else
					data[vi] = netherrack
				end

				nixyz = nixyz + 1
				vi = vi + 1
			end
		end
	end

	vm:set_data(data)
	vm:calc_lighting()
	vm:write_to_map()
	vm:update_liquids()
end)
