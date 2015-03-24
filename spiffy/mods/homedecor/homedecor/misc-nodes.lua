local S = homedecor.gettext

homedecor.register("ceiling_paint", {
	description = S("Textured Ceiling Paint"),
	drawtype = 'signlike',
	tiles = { 'homedecor_ceiling_paint.png' },
	inventory_image = 'homedecor_ceiling_paint_roller.png',
	wield_image = 'homedecor_ceiling_paint_roller.png',
	sunlight_propagates = true,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = { type = "wallmounted" },
})

homedecor.register("ceiling_tile", {
	description = S("Drop-Ceiling Tile"),
	drawtype = 'signlike',
	tiles = { 'homedecor_ceiling_tile.png' },
	wield_image = 'homedecor_ceiling_tile.png',
	inventory_image = 'homedecor_ceiling_tile.png',
	sunlight_propagates = true,
	walkable = false,
	groups = { snappy = 3 },
	sounds = default.node_sound_leaves_defaults(),
        selection_box = { type = "wallmounted" },
})

local rug_sizes = {"small", "large"}

for _, s in ipairs(rug_sizes) do
homedecor.register("rug_"..s, {
	description = S("Throw Rug ("..s..")"),
	drawtype = 'signlike',
	tiles = {"homedecor_rug_"..s..".png"},
	wield_image = "homedecor_rug_"..s..".png",
	inventory_image = "homedecor_rug_"..s..".png",
	sunlight_propagates = true,
	paramtype2 = "wallmounted",
	walkable = false,
	groups = {snappy = 3},
	sounds = default.node_sound_leaves_defaults(),
        selection_box = { type = "wallmounted" },
})
end

local pot_colors = {"black", "green", "terracotta"}

for _, p in ipairs(pot_colors) do
homedecor.register("flower_pot_"..p, {
	description = S("Flower Pot ("..p..")"),
	mesh = "homedecor_flowerpot.obj",
	tiles = { "homedecor_flower_pot_"..p..".png" },
	groups = { snappy = 3, potting_soil=1 },
	sounds = default.node_sound_leaves_defaults(),
})
end

homedecor.register("pole_brass", {
    description = S("Brass Pole"),
	mesh = "homedecor_round_pole.obj",
    tiles = {"homedecor_tile_brass2.png"},
    inventory_image = "homedecor_pole_brass_inv.png",
    wield_image = "homedecor_pole_brass_inv.png",
    selection_box = {
            type = "fixed",
            fixed = { -0.125, -0.5, -0.125, 0.125, 0.5, 0.125 },
    },
    collision_box = {
            type = "fixed",
            fixed = { -0.125, -0.5, -0.125, 0.125, 0.5, 0.125 },
    },
    groups = {snappy=3},
    sounds = default.node_sound_wood_defaults(),
})

homedecor.register("pole_wrought_iron", {
    description = S("Wrought Iron Pole"),
    tiles = {"homedecor_tile_wrought_iron2.png"},
    inventory_image = "homedecor_pole_wrought_iron_inv.png",
    wield_image = "homedecor_pole_wrought_iron_inv.png",
    selection_box = {
            type = "fixed",
            fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
    },
	node_box = {
		type = "fixed",
                fixed = {-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}
	},
    groups = {snappy=3},
    sounds = default.node_sound_wood_defaults(),
})

local welcome_mat_colors = { "green", "brown", "grey" }

for _, color in ipairs(welcome_mat_colors) do
	homedecor.register("welcome_mat_"..color, {
		description = "Welcome Mat ("..color..")",
		tiles = {
			"homedecor_welcome_mat_"..color..".png",
			"homedecor_welcome_mat_bottom.png",
			"homedecor_welcome_mat_"..color..".png",
		},
		groups = {crumbly=3},
		sounds = default.node_sound_dirt_defaults({
			footstep = {name="default_grass_footstep", gain=0.25},
		}),
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.375, 0.5, -0.46875, 0.375 }
		}
	})
end

homedecor.register("chimney", {
	description = "Chimney",
	tiles = {
		"homedecor_chimney_top.png",
		"homedecor_chimney_bottom.png",
		"homedecor_chimney_sides.png",
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.25, 0.25, 0.5, -0.1875},
			{-0.25, -0.5, 0.1875, 0.25, 0.5, 0.25},
			{-0.25, -0.5, -0.25, -0.1875, 0.5, 0.25},
			{0.1875, -0.5, -0.25, 0.25, 0.5, 0.25},
		}
	},
	selection_box = homedecor.nodebox.bar_y(0.25),
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults()
})

homedecor.register("fishtank", {
	description = "Fishtank",
	tiles = {
		"homedecor_fishtank_top.png",
		"homedecor_fishtank_bottom.png",
		"homedecor_fishtank_right.png",
		"homedecor_fishtank_left.png",
		"homedecor_fishtank_back.png",
		"homedecor_fishtank_front.png"
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,    -0.5,    -0.375,  0.5,    -0.4375, 0.375},
			{-0.4375, -0.4375, -0.3125, 0.4375,  0.1875, 0.3125},
			{-0.4375,  0.1875, -0.1875, 0.4375,  0.25,   0.1875},
			{-0.1875,  0.0625,  0.0625, 0.1875,  0.25,   0.375},
			{ 0.125,  -0.5,     0.25,   0.1875,  0.1875, 0.375},
			{-0.375,   0.25,   -0.125,  0.375,   0.3125, 0.125},
		}
	},
	use_texture_alpha = true,
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.375, 0.5, 0.3125, 0.375 }
	},
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
	on_rightclick = function(pos, node, clicker)
		fdir = minetest.get_node(pos).param2
		minetest.set_node(pos, {name = "homedecor:fishtank_lighted", param2 = fdir})
	end
})

homedecor.register("fishtank_lighted", {
	description = "Fishtank",
	tiles = {
		"homedecor_fishtank_top.png",
		"homedecor_fishtank_bottom.png",
		"homedecor_fishtank_right_lighted.png",
		"homedecor_fishtank_left_lighted.png",
		"homedecor_fishtank_back_lighted.png",
		"homedecor_fishtank_front_lighted.png"
	},
	light_source = LIGHT_MAX-4,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,    -0.5,    -0.375,  0.5,    -0.4375, 0.375},
			{-0.4375, -0.4375, -0.3125, 0.4375,  0.1875, 0.3125},
			{-0.4375,  0.1875, -0.1875, 0.4375,  0.25,   0.1875},
			{-0.1875,  0.0625,  0.0625, 0.1875,  0.25,   0.375},
			{ 0.125,  -0.5,     0.25,   0.1875,  0.1875, 0.375},
			{-0.375,   0.25,   -0.125,  0.375,   0.3125, 0.125},
		}
	},
	use_texture_alpha = true,
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.375, 0.5, 0.3125, 0.375 }
	},
	sunlight_propagates = true,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
	on_rightclick = function(pos, node, clicker)
		fdir = minetest.get_node(pos).param2
		minetest.set_node(pos, {name = "homedecor:fishtank", param2 = fdir})
	end
})

homedecor.register("cardboard_box_big", {
	description = S("Cardboard box (big)"),
	tiles = {
		'homedecor_cardbox_big_tb.png',
		'homedecor_cardbox_big_tb.png',
		'homedecor_cardbox_big_sides.png',
	},
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	infotext=S("Cardboard box"),
	inventory = {
		size=24,
	},
})

homedecor.register("cardboard_box", {
	description = S("Cardboard box"),
	tiles = {
		'homedecor_cardbox_tb.png',
		'homedecor_cardbox_tb.png',
		'homedecor_cardbox_sides.png',
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0, 0.3125},
		}
	},
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	infotext=S("Cardboard box"),
	inventory = {
		size=8,
	},
})

homedecor.register("dvd_cd_cabinet", {
	description = "DVD/CD cabinet",
	tiles = {
		"homedecor_dvdcd_cabinet_top.png",
		"homedecor_dvdcd_cabinet_top.png",
		"homedecor_dvdcd_cabinet_sides.png",
		"homedecor_dvdcd_cabinet_sides.png^[transformFX",
		"homedecor_dvdcd_cabinet_back.png",
		"homedecor_dvdcd_cabinet_front.png",
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0, -0.4375, 0.5, 0.5},
			{0.4375, -0.5, 0, 0.5, 0.5, 0.5},
			{-0.0625, -0.5, 0, 0.0625, 0.5, 0.5},
			{-0.5, 0.4375, 0, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0, 0.5, -0.4375, 0.5},
			{-0.5, -0.5, 0.0625, 0.5, 0.5, 0.4375},
			{-0.375, -0.5, 0.02756, -0.125, 0.5, 0.5},
			{0.125, -0.5, 0.01217, 0.375, 0.5, 0.5},
		}
	},
	selection_box = homedecor.nodebox.slab_z(0.5),
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3},
	sounds = default.node_sound_wood_defaults(),
})

homedecor.register("filing_cabinet", {
	description = S("Filing Cabinet"),
	tiles = {
		'forniture_wood.png',
		'homedecor_filing_cabinet_bottom.png',
		'forniture_wood.png',
		'forniture_wood.png',
		'forniture_wood.png',
		'homedecor_filing_cabinet_front.png'
	},
        selection_box = { type = "regular" },
        node_box = {
                type = "fixed",
		fixed = {
			{ -8/16, -8/16, -30/64,  8/16,  8/16,   8/16 },	-- main body
			{ -7/16, -7/16, -8/16,  7/16,  7/16,   8/16 },	-- drawer
		}
        },
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	infotext=S("Filing cabinet"),
	inventory = {
		size=16,
	},
})

local pooltable_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.5, 0.5, 0.3125, 1.5 }
}

homedecor.register("pool_table", {
	mesh = "homedecor_pool_table.obj",
	tiles = {
		"homedecor_pool_table_cue.png",
		"homedecor_pool_table_baize.png",
		"homedecor_pool_table_pockets.png",
		"homedecor_pool_table_balls.png",
		"homedecor_pool_table_wood.png"
	},
	description = "Pool Table",
	inventory_image = "homedecor_pool_table_inv.png",
	groups = {snappy=3},
	selection_box = pooltable_cbox,
	collision_box = pooltable_cbox,
	expand = { forward="air" },
})

minetest.register_alias("homedecor:pool_table_2", "air")

local trash_cbox = {
	type = "fixed",
	fixed = { -0.25, -0.5, -0.25, 0.25, 0.125, 0.25 }
}

homedecor.register("trash_can", {
	drawtype = "mesh",
	mesh = "homedecor_trash_can.obj",
	tiles = { "homedecor_trash_can.png" },
	inventory_image = "homedecor_trash_can_inv.png",
	description = "Trash Can",
        groups = {snappy=3},
	selection_box = trash_cbox,
	collision_box = trash_cbox,
})

homedecor.register("coatrack_wallmount", {
	tiles = { "forniture_wood.png" },
	inventory_image = "homedecor_coatrack_wallmount_inv.png",
	description = "Coatrack (wallmounted)",
        groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, 0, 0.4375, 0.375, 0.14, 0.5}, -- NodeBox1
			{-0.3025, 0.0475, 0.375, -0.26, 0.09, 0.4375}, -- NodeBox2
			{0.26, 0.0475, 0.375, 0.3025, 0.09, 0.4375}, -- NodeBox3
			{0.0725, 0.0475, 0.375, 0.115, 0.09, 0.4375}, -- NodeBox4
			{-0.115, 0.0475, 0.375, -0.0725, 0.09, 0.4375}, -- NodeBox5
			{0.24, 0.025, 0.352697, 0.3225, 0.115, 0.375}, -- NodeBox6
			{-0.3225, 0.025, 0.352697, -0.24, 0.115, 0.375}, -- NodeBox7
			{-0.135, 0.025, 0.352697, -0.0525, 0.115, 0.375}, -- NodeBox8
			{0.0525, 0.025, 0.352697, 0.135, 0.115, 0.375}, -- NodeBox9
		}
	},
})

homedecor.register("coat_tree", {
	tiles = { "forniture_wood.png" },
	inventory_image = "homedecor_coatrack_inv.png",
	description = "Coat tree",
	groups = {snappy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, 0, 0.0625, 1.5, 0.0625}, -- NodeBox1
			{-0.125, -0.5, -0.125, 0.1875, -0.4375, 0.1875}, -- NodeBox2
			{0.1875, -0.5, -0.0625, 0.22, -0.4375, 0.125}, -- NodeBox3
			{-0.0625, -0.5, 0.188, 0.125, -0.4375, 0.22}, -- NodeBox4
			{-0.16, -0.5, -0.0625, -0.125, -0.4375, 0.125}, -- NodeBox5
			{-0.0625, -0.5, -0.16, 0.125, -0.4375, -0.125}, -- NodeBox6
			{-0.25, 1.1875, 0, 0.3125, 1.25, 0.0625}, -- NodeBox7
			{0, 1.1875, -0.25, 0.0625, 1.25, 0.3125}, -- NodeBox8
			{-0.0207468, 1.4375, -0.0207468, 0.0829876, 1.5, 0.0829876}, -- NodeBox9
		}
	},
})

local cutlery_cbox = {
	type = "fixed",
	fixed = {
		{ -5/16, -8/16, -6/16, 5/16, -7/16, 2/16 },
		{ -2/16, -8/16,  2/16, 2/16, -4/16, 6/16 }
	}
}

homedecor.register("cutlery_set", {
	drawtype = "mesh",
	mesh = "homedecor_cutlery_set.obj",
	tiles = { "homedecor_cutlery_set.png"	},
	inventory_image = "homedecor_cutlery_set_inv.png",
	description = "Cutlery set",
	groups = {snappy=3},
	selection_box = cutlery_cbox,
	collision_box = cutlery_cbox
})

local bottle_cbox = {
	type = "fixed",
	fixed = {
		{ -0.125, -0.5, -0.125, 0.125, 0, 0.125}
	}
}

local fbottle_cbox = {
	type = "fixed",
	fixed = {
		{ -0.375, -0.5, -0.3125, 0.375, 0, 0.3125 }
	}
}

local bottle_colors = {"brown", "green"}

for _, b in ipairs(bottle_colors) do

homedecor.register("bottle_"..b, {
	tiles = { "homedecor_bottle_"..b..".png" },
	inventory_image = "homedecor_bottle_"..b.."_inv.png",
	description = "Bottle ("..b..")",
	mesh = "homedecor_bottle.obj",
	sunlight_propagates = true,
	groups = {snappy=3},
	collision_box = bottle_cbox,
	selection_box = bottle_cbox
})

-- 4-bottle sets

homedecor.register("4_bottles_"..b, {
	tiles = { "homedecor_bottle_"..b..".png" },
	inventory_image = "homedecor_4_bottles_"..b.."_inv.png",
	description = "Four "..b.." bottles",
	mesh = "homedecor_4_bottles.obj",
	sunlight_propagates = true,
	groups = {snappy=3},
	collision_box = fbottle_cbox,
	selection_box = fbottle_cbox
})

end

homedecor.register("4_bottles_multi", {
	tiles = { "homedecor_4_bottles_multi.png" },
	inventory_image = "homedecor_4_bottles_multi_inv.png",
	description = "Four misc brown/green bottles",
	mesh = "homedecor_4_bottles_multi.obj",
	sunlight_propagates = true,
	groups = {snappy=3},
	collision_box = fbottle_cbox,
	selection_box = fbottle_cbox
})

homedecor.register("dartboard", {
	description = "Dartboard",
	mesh = "homedecor_dartboard.obj",
	tiles = { "homedecor_dartboard.png" },
	inventory_image = "homedecor_dartboard_inv.png",
	wield_image = "homedecor_dartboard_inv.png",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

local piano_cbox = {
	type = "fixed",
	fixed = { -0.5, -0.5, -0.125, 1.5, 0.5, 0.5 }
}

homedecor.register("piano", {
	mesh = "homedecor_piano.obj",
	tiles = {
		"homedecor_piano_keys.png",
		"homedecor_tile_brass2.png",
		"homedecor_piano_wood.png"
	},
	inventory_image = "homedecor_piano_inv.png",
	description = "Piano",
	groups = { snappy = 3 },
	selection_box = piano_cbox,
	collision_box = piano_cbox,
	expand = { right="air" },
})

minetest.register_alias("homedecor:piano_left", "homedecor:piano")
minetest.register_alias("homedecor:piano_right", "air")

homedecor.register("trophy", {
        description = "Trophy",
	tiles = {
		"default_gold_block.png"
	},
	inventory_image = "homedecor_trophy_inv.png",
        groups = { snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.1875, -0.4375, 0.1875}, -- NodeBox1
			{-0.0625, -0.4375, -0.0625, 0.125, -0.375, 0.125}, -- NodeBox2
			{-0.02, -0.375, -0.02, 0.0825, -0.1875, 0.0825}, -- NodeBox3
			{-0.0625, -0.1875, -0.0625, 0.125, -0.125, 0.125}, -- NodeBox4
			{-0.125, -0.1875, -0.0625, -0.0625, 0.125, 0.125}, -- NodeBox5
			{0.125, -0.1875, -0.0625, 0.1875, 0.125, 0.125}, -- NodeBox6
			{-0.125, -0.1875, 0.125, 0.1875, 0.125, 0.1875}, -- NodeBox7
			{-0.125, -0.1875, -0.125, 0.1875, 0.125, -0.0625}, -- NodeBox8
			{-0.0625, -0.25, -0.0625, 0.125, -0.1875, 0.125}, -- NodeBox9
			{0.1875, 0.05, 0, 0.23, 0.0925, 0.0625}, -- NodeBox10
			{0.1875, -0.15, 0, 0.23, -0.11, 0.0625}, -- NodeBox11
			{0.23, -0.15, 0, 0.2725, 0.0925, 0.0625}, -- NodeBox12
			{-0.1675, -0.15, 0, -0.125, -0.11, 0.0625}, -- NodeBox13
			{-0.1675, 0.05, 0, -0.125, 0.0925, 0.0625}, -- NodeBox14
			{-0.21, -0.15, 0, -0.1675, 0.0925, 0.0625}, -- NodeBox15
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.21, -0.5, -0.125, 0.2725, 0.125, 0.1875 }
	}
})

homedecor.register("sportbench", {
	description = "Sport bench",
	tiles = {
		"homedecor_sportbench_top.png",
		"wool_black.png",
		"homedecor_sportbench_left.png^[transformFX",
		"homedecor_sportbench_left.png",
		"homedecor_sportbench_bottom.png",
		"homedecor_sportbench_front.png"
	},
	groups = { snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.3125, -0.5, 0.1875, -0.25, 0.5}, -- NodeBox1
			{-0.1875, -0.5, -0.5, -0.125, -0.3125, -0.4375}, -- NodeBox2
			{0.125, -0.5, -0.5, 0.1875, -0.3125, -0.4375}, -- NodeBox3
			{0.1875, -0.5, 0.375, 0.25, 0.375, 0.4375}, -- NodeBox4
			{-0.25, -0.5, 0.375, -0.1875, 0.375, 0.4375}, -- NodeBox5
			{-0.5, 0.125, 0.36, 0.5, 0.14, 0.375}, -- NodeBox6
			{0.3125, 0, 0.225, 0.35, 0.285, 0.5}, -- NodeBox7
			{-0.35, 0, 0.225, -0.3125, 0.285, 0.5}, -- NodeBox8
			{-0.1875, -0.375, 0.375, 0.1875, -0.3125, 0.4375}, -- NodeBox9
			{-0.23, 0.11, 0.33, -0.2075, 0.125, 0.375}, -- NodeBox10
			{0.2075, 0.11, 0.33, 0.23, 0.125, 0.375}, -- NodeBox11
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.4, -0.5, -0.5, 0.4, 0.375, 0.5 }
	}
})

homedecor.register("skateboard", {
        description = "Skateboard",
	tiles = {
		"homedecor_skateboard_top.png",
		"homedecor_skateboard_bottom.png",
		"homedecor_skateboard_sides.png"
	},
	inventory_image = "homedecor_skateboard_inv.png",
	groups = { snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.4375, -0.1875, 0.4375, -0.415, 0.125}, -- NodeBox1
			{-0.375, -0.5, 0.0625, -0.3125, -0.4375, 0.125}, -- NodeBox2
			{-0.375, -0.5, -0.1875, -0.3125, -0.4375, -0.125}, -- NodeBox3
			{0.3125, -0.5, 0.0625, 0.375, -0.4375, 0.125}, -- NodeBox4
			{0.3125, -0.5, -0.1875, 0.375, -0.4375, -0.125}, -- NodeBox5
			{-0.5, -0.4375, -0.16, -0.4375, -0.415, 0.0975}, -- NodeBox6
			{0.4375, -0.4375, -0.16, 0.5, -0.415, 0.0975}, -- NodeBox7
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.5, -0.5, -0.2, 0.5, -0.40, 0.125 }
	},
	on_place = minetest.rotate_node
})

homedecor.register("beer_tap", {
	description = "Beer tap",
	tiles = {
		"homedecor_beertap_front.png",
		"homedecor_beertap_front.png",
		"homedecor_beertap_right.png",
		"homedecor_beertap_right.png^[transformFX",
		"homedecor_beertap_front.png",
		"homedecor_beertap_front.png"
	},
	inventory_image = "homedecor_beertap_inv.png",
	groups = { snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.5, -0.4375, 0.25, -0.48, 0}, -- NodeBox1
			{-0.0625, -0.48, -0.1875, 0.0625, 0.125, -0.0625}, -- NodeBox2
			{-0.1875, 0, -0.375, -0.125, 0.0315, -0.125}, -- NodeBox3
			{-0.1875, 0, -0.1875, 0.1875, 0.0315, -0.125}, -- NodeBox4
			{0.125, 0, -0.375, 0.1875, 0.0315, -0.125}, -- NodeBox5
			{0.135, 0.0315, -0.3225, 0.1775, 0.235, -0.29}, -- NodeBox6
			{-0.1775, 0.0315, -0.3225, -0.135, 0.235, -0.29}, -- NodeBox7
			{-0.1675, -0.0825, -0.355, -0.145, 0, -0.3325}, -- NodeBox8
			{0.145, -0.0825, -0.355, 0.1675, 0, -0.3325}, -- NodeBox9
		}
	},
	selection_box = {
		type = "fixed",
		fixed = { -0.25, -0.5, -0.4375, 0.25, 0.235, 0 }
	},
	on_punch = function(pos, node, puncher, pointed_thing)
		local wielditem = puncher:get_wielded_item()
		local inv = puncher:get_inventory()

		local wieldname = wielditem:get_name()
		if wieldname == "vessels:drinking_glass" then
			if inv:room_for_item("main", "homedecor:beer_mug 1") then
				wielditem:take_item()
				puncher:set_wielded_item(wielditem)
				inv:add_item("main", "homedecor:beer_mug 1")
				minetest.chat_send_player(puncher:get_player_name(), "Ahh, a frosty cold beer - look in your inventory for it!")
			else
				minetest.chat_send_player(puncher:get_player_name(), "No room in your inventory to add a beer mug!")
			end
		end
	end
})

local beer_cbox = {
	type = "fixed",
	fixed = { -5/32, -8/16, -9/32 , 7/32, -2/16, 1/32 }
}

homedecor.register("beer_mug", {
	description = "Beer mug",
	drawtype = "mesh",
	mesh = "homedecor_beer_mug.obj",
	tiles = { "homedecor_beer_mug.png" },
	inventory_image = "homedecor_beer_mug_inv.png",
	groups = { snappy=3, oddly_breakable_by_hand=3 },
	sounds = default.node_sound_glass_defaults(),
	selection_box = beer_cbox,
	collision_box = beer_cbox
})

homedecor.register("tool_cabinet_bottom", {
	description = "Metal tool cabinet and work table",
	tiles = {
		"homedecor_tool_cabinet_bottom_top.png",
		"homedecor_tool_cabinet_bottom_sides.png",
		"homedecor_tool_cabinet_bottom_sides.png",
		"homedecor_tool_cabinet_bottom_sides.png",
		"homedecor_tool_cabinet_bottom_sides.png",
		"homedecor_tool_cabinet_bottom_front.png"
	},
	inventory_image = "homedecor_tool_cabinet_inv.png",
	groups = { snappy=3 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.4375, -0.4375, -0.375, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.5, -0.4375, -0.375, -0.4375}, -- NodeBox2
			{0.4375, -0.5, 0.4375, 0.5, -0.375, 0.5}, -- NodeBox3
			{0.4375, -0.5, -0.5, 0.5, -0.375, -0.4375}, -- NodeBox4
			{-0.5, -0.375, -0.5, 0.5, 0.5, 0.5}, -- NodeBox5
		}
	},
	selection_box = homedecor.nodebox.slab_y(2),
	expand = { top="homedecor:tool_cabinet_top" },
	inventory = {
		size=24,
	}
})

homedecor.register("tool_cabinet_top", {
	tiles = {
		"homedecor_tool_cabinet_top_top.png",
		"homedecor_tool_cabinet_top_bottom.png",
		"homedecor_tool_cabinet_top_right.png",
		"homedecor_tool_cabinet_top_left.png",
		"homedecor_tool_cabinet_top_back.png",
		"homedecor_tool_cabinet_top_front.png"
	},
	groups = { snappy=3, not_in_creative_inventory=1 },
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, 0.4375, 0.5, 0.5, 0.5}, -- NodeBox1
			{-0.5, -0.5, -0.4375, -0.1875, -0.4375, 0.125}, -- NodeBox2
			{-0.375, -0.4375, 0, -0.3125, 0.1875, 0.0625}, -- NodeBox3
			{-0.4375, -0.1875, -0.375, -0.25, 0.125, 0.125}, -- NodeBox4
			{-0.25, -0.0625, -0.3125, -0.22, 0.3125, -0.2825}, -- NodeBox5
			{-0.375, -0.1875, -0.25, -0.3125, -0.218, -0.3125}, -- NodeBox6
			{-0.35, -0.32, -0.285, -0.3375, -0.218, -0.2725}, -- NodeBox7
			{0, -0.3125, 0.375, 0.0625, 0.1875, 0.4375}, -- NodeBox8
			{0.125, 0.1875, 0.375, 0.1875, 0.25, 0.4375}, -- NodeBox9
			{-0.0625, 0.1875, 0.375, 0.125, 0.3125, 0.4375}, -- NodeBox10
			{0.343, -0.125, 0.42, 0.375, 0.125, 0.4375}, -- NodeBox11
			{0.3125, 0.095, 0.42, 0.343, 0.1575, 0.4375}, -- NodeBox12
			{0.375, 0.095, 0.42, 0.405, 0.1575, 0.4375}, -- NodeBox13
			{0.3125, -0.155, 0.42, 0.343, -0.093, 0.4375}, -- NodeBox14
			{0.375, -0.155, 0.42, 0.405, -0.093, 0.4375}, -- NodeBox15
		}
	},
	selection_box = homedecor.nodebox.null
})

homedecor.register("calendar", {
	description = "Calendar",
	drawtype = "signlike",
	tiles = {"homedecor_calendar.png"},
	inventory_image = "homedecor_calendar.png",
	wield_image = "homedecor_calendar.png",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

local globe_cbox = {
	type = "fixed",
	fixed = { -0.4, -0.5, -0.3, 0.3, 0.3, 0.3 }
}

homedecor.register("desk_globe", {
	description = "Desk globe",
	mesh = "homedecor_desk_globe.obj",
	tiles = {"homedecor_desk_globe.png"},
	inventory_image = "homedecor_desk_globe_inv.png",
	selection_box = globe_cbox,
	collision_box = globe_cbox,
	groups = {choppy=2},
	sounds = default.node_sound_defaults(),
})

local wine_cbox = homedecor.nodebox.slab_z(0.25)
homedecor.register("wine_rack", {
	description = "Wine Rack",
	mesh = "homedecor_wine_rack.obj",
	tiles = {"homedecor_wine_rack.png"},
	inventory_image = "homedecor_wine_rack_inv.png",
	groups = {choppy=2},
	selection_box = wine_cbox,
	collision_box = wine_cbox,
	sounds = default.node_sound_defaults(),
})

local pframe_cbox = {
	type = "fixed",
	fixed = { -0.18, -0.5, -0.08, 0.18, -0.08, 0.18 }
}
local n = { 1, 2 }

for _, i in ipairs(n) do
	homedecor.register("picture_frame"..i, {
		description = S("Picture Frame"),
		mesh = "homedecor_picture_frame.obj",
		tiles = { "homedecor_picture_frame"..i..".png" },
		inventory_image = "homedecor_picture_frame"..i.."_inv.png",
		wield_image = "homedecor_picture_frame"..i.."_inv.png",
		groups = {snappy = 3},
		selection_box = pframe_cbox,
		collision_box = pframe_cbox,
	})
end
