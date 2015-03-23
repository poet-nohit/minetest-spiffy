minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		if player:get_hp() > 0 or not minetest.setting_getbool("enable_damage") then
			local pos = player:getpos()
			local inv = player:get_inventory()
			local ctrl = player:get_player_control()
			if ctrl.up or ctrl.left or ctrl.right then
				for _,object in ipairs(minetest.get_objects_inside_radius(pos, 2.0)) do
					if not object:is_player() and object:get_luaentity() and
							object:get_luaentity().name == "__builtin:item" then
						if inv and inv:room_for_item("main",
								ItemStack(object:get_luaentity().itemstring)) then
							inv:add_item("main", ItemStack(object:get_luaentity().itemstring))
							if object:get_luaentity().itemstring ~= "" then
								minetest.sound_play("item_drop_pickup",
									{pos = pos, gain = 0.3, max_hear_distance = 16})
							end
							object:get_luaentity().itemstring = ""
							object:remove()
						end
					end
				end
			end
		end
	end
end)
