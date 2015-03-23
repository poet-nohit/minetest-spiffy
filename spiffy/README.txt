The Spiffy game for the Minetest game engine [spiffy]
==========================================================
Description:

Why spiffy? Well, because I like to keep things updated
and in their place. A nice peaceful world above, all
things wretched and horrible down below. Now, sometimes
you have to go retrieve things from down there, but it's
all about making a big splash in the above world, really.

==========================================================
Installation:

To use this game with Minetest, move the spiffy folder to:

  minetest/games/

See http://wiki.minetest.net/Getting_Started for more info.

Minetest can be found at:

http://minetest.net/
https://github.com/minetest/minetest/

==========================================================
Credits:

3d_armor: by stu
  https://forum.minetest.net/viewtopic.php?f=11&t=4654
ambience: "Ambience Ultralite" by Neuromancer, TenPlus1 and kilbith
  https://forum.minetest.net/viewtopic.php?p=151166#p151166
bedrock: by Calinou
  https://forum.minetest.net/viewtopic.php?f=11&t=9231
builtin_item: by PilzAdam and Calinou
  https://forum.minetest.net/viewtopic.php?f=11&t=9637
carts: by PilzAdam
  https://forum.minetest.net/viewtopic.php?f=11&t=2451
digilines: by Jeija
  https://forum.minetest.net/viewtopic.php?f=11&t=5263
farming: "farming redo" by webdesigner97 and TenPlus1
  https://forum.minetest.net/viewtopic.php?f=11&t=9019
gs_tools: by gsmanners
  https://forum.minetest.net/viewtopic.php?f=11&t=8970
hud: by BlockMen
  https://forum.minetest.net/viewtopic.php?f=11&t=6342
item_drop: by PilzAdam and Calinou
  https://forum.minetest.net/viewtopic.php?f=11&t=9638
itemframes: by Zeg9 and VanessaE
  https://forum.minetest.net/viewtopic.php?f=11&t=2041
mesecons: by Jeija
  https://forum.minetest.net/viewtopic.php?f=11&t=628
mobs: "mobs redo" by PilzAdam and TenPlus1
  https://forum.minetest.net/viewtopic.php?f=11&t=9917
moreblocks: by Calinou
  https://forum.minetest.net/viewtopic.php?f=11&t=509
moreores: by Calinou
  https://forum.minetest.net/viewtopic.php?f=11&t=549
nether: by PilzAdam
  https://forum.minetest.net/viewtopic.php?f=11&t=5790
pipeworks: by VanessaE
  https://forum.minetest.net/viewtopic.php?f=11&t=2155
signs_lib: by PilzAdam and VanessaE
  https://forum.minetest.net/viewtopic.php?f=11&t=2041
snow: by Frei and Calinou
  https://forum.minetest.net/viewtopic.php?f=11&t=10099
snowdrift: by paramat
  https://forum.minetest.net/viewtopic.php?f=11&t=6854
subterrain: by paramat
  https://forum.minetest.net/viewtopic.php?f=11&t=9601
technic: by RealBadAngel
  https://forum.minetest.net/viewtopic.php?f=11&t=2538
throwing: by PilzAdam
  https://forum.minetest.net/viewtopic.php?f=11&t=2805
unified_inventory: by RealBadAngel
  https://forum.minetest.net/viewtopic.php?f=11&t=3933
worldedit: by sfan5
  https://forum.minetest.net/viewtopic.php?f=11&t=572

The following are from minetest_game:
  https://github.com/minetest/minetest_game

beds: by BlockMen
boats: by PilzAdam
bones: by PilzAdam
bucket: by Kahrl and celeron55
creative: by celeron55
default: by celeron55
doors: by PilzAdam and BlockMen
dye: by celeron55
fire: by celeron55
flowers: by Ironzorg and VanessaE
screwdriver: by RealBadAngel
sethome: by xyz
stairs: by Kahrl and celeron55
vessels: by VanessaE and celeron55
wool: by celeron55
xpanes: by xyz and BlockMen

This subgame was put together by me (poet.nohit). All
changes listed below are by me.

==========================================================
Changes:

The main difference between this and the default mods is
that huge caverns are generated beneath the surface, lava
is far underground (very near to bedrock, which is at
-256 on your Y coord), and nearly all the menacing things
you might encounter are at -64 or lower.

Most of the ores you'll want are much higher than the
normal game. For example, gold can be found at -32 and
diamonds at -48.

If you go to -128 or lower, lava vaporizes water. If you
want to make obsidian, you'll need to go far beneath the
surface and collect lava, then carry it back up to above
that level.

Trees now work like cactus and papyrus--that is, you
chop/dig the lowest block and the blocks above will then
fall immediately.

bedrock: added a can_dig function and moved it to -256
carts: punching a cart while in it will pick it up
default: changes how lava cools, leaves decay, made clay
  more abundant and raised the heights for various ores,
  made trees dig_up like papyrus/cactus
gs_tools: removed lumber axe, changes steel tool names to
  iron, a few small fixes
mesecons: removed commands blocks and note blocks
mobs: made monsters spawn deep underground or on
  netherrack, rats spawn in the dark, removed DM griefing
moreores: made mithril generate higher and mithril tools
  go insanely fast
nether: changed the way portals are made and built so
  that you don't fall to your death usually, portals
  send you to coords/10 in the nether, the normal ores
  are kept in the netherrack, netherrack is more useful
  and less annoying, the nether itself is generated
  using a modified version of paramat's subterrain
  method
signs_lib: removed the "steel" recipes
subterrain: added lava lake generation
technic: made uranium ore a light source, messed with
  the oregen to get that working with my bedrock,
  changed rubber tree so that it does dig_up

==========================================================
Licenses:

Copyright (C) 2010-2012 celeron55, Perttu Ahola <celeron55@gmail.com>
See README.txt in each mod directory for information about other authors.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

License of media (textures and sounds)
--------------------------------------

Copyright (C) 2010-2012 celeron55, Perttu Ahola <celeron55@gmail.com>
See README.txt in each mod directory for information about other authors.

Some textures in default are by Calinou (CC BY-SA 4.0),
VanessaE (WTFPL), kotolegokot (CC BY-SA 3.0), and BlockMen (CC BY-SA 3.0).

Sound "nether_teleport" is by poet.nohit (WTFPL).

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
http://creativecommons.org/licenses/by-sa/3.0/
