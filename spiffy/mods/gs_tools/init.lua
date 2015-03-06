-- tool mods, by gsmanners
-- license: WTFPL

--------------------------------------------------

-- tool mods are Minetest modifications that add useful devices
--
-- the aim of this mod is to make tools that are simple, powerful, and fast
-- to be coherent, visually appealing, and as user friendly as possible

--------------------------------------------------
-- def

gs_tools = {}

local modpath = minetest.get_modpath("gs_tools")
gs_tools.modpath = modpath
gs_tools.player_inv_width = 8

--------------------------------------------------
-- modules

dofile(modpath.."/crafts.lua")

dofile(modpath.."/anvils.lua")
-- *** default tree dig tears it all down
dofile(modpath.."/ladders.lua")
dofile(modpath.."/sledges.lua")
dofile(modpath.."/torches.lua")
dofile(modpath.."/workbench.lua")

--------------------------------------------------
-- support

-- get player inventory width
-- this is set dynamically, so I have to detect this dynamically

gs_tools.get_player_inv_width = function()
	local p = minetest.get_connected_players()
	if p and #p > 0 then
		local i,v = next(p)
		-- I'm kind of assuming that the player inventory has 4 rows, here
		gs_tools.player_inv_width = math.floor( v:get_inventory():get_size("main") / 4 )
	else
		-- just keep waiting till we get this info
		minetest.after(1.5, gs_tools.get_player_inv_width)
	end
end

minetest.after(1.5, gs_tools.get_player_inv_width)

-- *** removed drop_node

-- make a list of the 8 neighboring blocks around the pos a digger has targeted

function gs_tools.get_3x3s(pos, digger)
	local r = {}
	
	local a = 0		-- forward/backward
	if math.abs(pos.x - digger:getpos().x) > 
		math.abs(pos.z - digger:getpos().z) then a = 1 end -- sideways

	local b = 0		-- horizontal (default)
	local q = digger:get_look_pitch()
	if q < -0.78 or q > 0.78 then b = 1 end  -- vertical

	local c = 1
	for x=-1,1 do
	for y=-1,1 do
		if x ~= 0 or y ~= 0 then
			-- determine next perpendicular node
			local k = {x=0, y=0, z=0}
			if a > 0 then
				k.z = pos.z + x
				if b > 0 then
					k.x = pos.x + y
					k.y = pos.y
				else
					k.x = pos.x
					k.y = pos.y + y
				end
			else
				k.x = pos.x + x
				if b > 0 then
					k.y = pos.y
					k.z = pos.z + y
				else
					k.y = pos.y + y
					k.z = pos.z
				end
			end

			r[c] = {x=k.x, y=k.y, z=k.z}
			c = c + 1
		end
	end
	end

	return r
end
