
--
-- Helper functions
--

cart_func = {}

-- get a second opinion on what lies ahead

function cart_func:get_content_voxel(pos)
	local t1 = os.clock()
	local vm = minetest.get_voxel_manip()
	local pos1, pos2 = vm:read_from_map(vector.add(pos, {x=-1,y=-1,z=-1}),vector.add(pos, {x=1,y=1,z=1}))
	local a = VoxelArea:new{
		MinEdge=pos1,
		MaxEdge=pos2,
	}
	 
	local data = vm:get_data()
	local vi = a:indexp(pos)
	local railid = data[vi]
	local real_name = minetest.get_name_from_content_id(railid)
	return real_name
end

function cart_func:get_sign(z)
	if z == 0 then
		return 0
	else
		return z/math.abs(z)
	end
end

-- Returns the velocity as a unit vector
-- The smaller part of the vector will be turned to 0
function cart_func:velocity_to_dir(v)
	if math.abs(v.x) > math.abs(v.z) then
		return {x=cart_func:get_sign(v.x), y=cart_func:get_sign(v.y), z=0}
	else
		return {x=0, y=cart_func:get_sign(v.y), z=cart_func:get_sign(v.z)}
	end
end

function cart_func:is_rail(p)
	local nn = minetest.env:get_node(p).name
	if nn=="ignore" then
		nn=cart_func:get_content_voxel(p)
	end
  	return minetest.get_item_group(nn, "rail") ~= 0
end

function cart_func:is_int(z)
	z = math.abs(z)
	return math.abs(math.floor(z+0.5)-z) <= 0.1
end

cart_func.v3 = {}

function cart_func.v3:add(v1, v2)
	return {x=v1.x+v2.x, y=v1.y+v2.y, z=v1.z+v2.z}
end

function cart_func.v3:copy(v)
	return {x=v.x, y=v.y, z=v.z}
end

function cart_func.v3:round(v)
	return {
		x = math.floor(v.x+0.5),
		y = math.floor(v.y+0.5),
		z = math.floor(v.z+0.5),
	}
end

function cart_func.v3:equal(v1, v2)
	return v1.x == v2.x and v1.y == v2.y and v1.z == v2.z
end
