Tool Mods, by gsmanners
license: WTFPL

--------------------------------------------------
Tool Mods

Tool Mods are Minetest modifications that add useful devices.

The aim of this mod is to make tools that are simple, powerful, and fast;
to be coherent, visually appealing, and as user friendly as possible.

--------------------------------------------------
Crafts

This mod adds several generic crafting recipes that make building these
tools easier.

Rods:

You can make 4 clay rods from 2 clay bricks, or 4 steel rods from 2 steel
ingots. 4 stone rods are made from 3 cobble in a diagonal line:

--C
-C-
C--

The recipes for rods are also reversible.

Clay:

To make clay, you can simply combine papyrus with dirt and a bucket of water.
You can then fire the clay into bricks with any furnace or oven. Crafting
clay consumes the water, though not the container.

Condensed Cobblestone:

You can condense cobble so that it uses 1/3 the space of normal cobble.
9 cobble turns into 3 condensed cobble (and vice versa). This makes it
somewhat easier to store and is also used for sledges.

Charcoal:

To make charcoal, simply cook a log of any type of tree or papyrus in a
furnace. Note that papyrus turns into sugar coal, which is only about a
fourth as good as regular charcoal for cooking.

Charcoal has the same cooking characteristics as coal. You use them for fuel
or for making torches, and you can also transform them into blocks for
storage/building.

--------------------------------------------------
Sledges

Sledges are basically like pickaxes that do additional digging
(when you break a block, it instantly mines out the 8 blocks perpendicular
to the direction the tool is used).

There are 3 types of sledges: stone, bronze and obsidian.

Stone is cheap, but is slow, brittle and cannot break very hard blocks.
Bronze is extremely fast but wears out relatively quickly.
Obsidian is not as fast as bronze, but it is very durable.

Sledge recipes:

Stone Sledgehammer (C = Condensed Cobblestone, R = Steel Rods)

CCC
-R-
-R-

Bronze Sledgehammer (B = Bronze Ingot, S = Stone Sledge):

BBB
BBB
-S-

Obsidian Sledgehammer (O = Obsidian, S = Stone Sledge):

OOO
OOO
-S-

--------------------------------------------------
Workbenches

Workbenches are extensions of your own personal crafting capabilities.
They provide guides, automation, and four additional crafting areas.
Consequently, they can also store up to 36 stacks of items.

Workbench recipe (W = Wood, S = Stick, C = Chest):

WWW
SCS
S-S

A chest is like making a donut, but with wood planks:

WWW
W-W
WWW

When used, the workbench contains a list of items, a recipe, and one of
four workbench areas (A, B, C, and D). The list is on the left, the recipe 
is in the middle, and the workbench is on the right.

The list:

The list lets you find items by mod name, by a search pattern, or by the
selected item's usage. You can also see a list of previously selected items.

To see the recipe of a particular item, find it in the list and click on the
item's button in the list. That item then becomes the selected item.

To change the mod name, select the mod from the dropdown list and click
the "Mod" button.

To search for a particular item by name, type in part of the name in the
search field, then click the "Search" button. To clear the search field,
click the "x" button next to it.

To see a list of previously selected items, click the "^" button next to
the "x" button.

The recipe:

The recipe shows you how to make the selected item. In the grid below the
type box and the arrow buttons is the list of items you will need to make
the selected item.

The type box shows you how the item is made, either by "Craft" or "Cook".
For now, these buttons do nothing (other than show you how a particular
recipe works).

If you have Technic installed, the type can also be "Alloy", "Grind", 
"Comp", or "Extr" (which indicates that the recipe uses an alloy furnace,
a grinder, a compressor, or an extractor, respectively).

The arrow buttons next to the type box let you select alternative recipes
(if the selected item has more than one).

If the item is a list of groups, rather than a specific item, you will see
a button with the word "Group" on it. To see all the items that belong to
those groups, click that button. To return to the normal list, click the
"x" button (next to the search field).

To see how the selected item is used by other items, click the "Uses" button
under the recipe for the item (just above your inventory list). That button
then becomes "List" (which you can click to see the normal list again).

Next to the "Uses" button is the number of items the above recipe produces
(if more than one) followed by the item's description.

The workbench areas:

Above the usual crafting grid is a "+" button, a "+10" button, a "Make"
button, and a "Clear" button.

To add one set of recipe items to the crafting grid, select the item from
the list and then click the "+" button. To add ten sets of recipe items,
click the "+10" button. Note that these will only place as many items as
you can (from the items you have in your inventory).

To craft the item and place the result into your inventory, click the
"Make" button.

To move all the items from the workbench area into your inventory, click the
"Clear" button.

All of the above actions only take place on the selected area, which you can
change by clicking on one of the buttons below the crafting grid (either
"A", "B", "C", or "D".

Items in the crafting grids will remain there until you craft with them, and
the workbench areas do not interfere with each other.

The item to the right of the crafting grid is the preview item (the item you
will make if you decide to craft what is currently in the grid). You can take
that item, as well, but you cannot place anything in it.

Note that extraneous items left in the workbench or the preview window that
cannot be put in your inventory (because your inventory is full, for example)
will spill out into the world on top of your workbench.

--------------------------------------------------
Ladders

Ladders are mostly just for cosmetic effect, but the material itself will
offer your ladders the durability that wood ladders are sorely missing.

To craft a ladder, you simply make an H with rods made of the material:

X-X
XXX
X-X

If you use sticks, you get wood ladders. Stone rods make stone ladders, etc.

--------------------------------------------------
Axes

A lumber axe can drop a whole tree with just a few hits. If a tree is
thicker than one block, you will need to chop more than one block to drop
it.

To craft a lumber axe, you will need 4 steel ingots and a steel axe:

SS-
SS-
-A-

--------------------------------------------------
Anvils

Anvils let you repair tools, weapons, and armor. You provide an item that has
some wear and some raw material, and the anvil will reduce the wear on that item.
The amount you can repair depends on your skill with the anvil (which increases
when you use the anvil).

To craft an anvil, you will need lots of steel (B = block of steel, S = steel ingot):

BBB
-S-
SSS

Only one player can use an anvil at a time.

To use the anvil, right click on it and put the tool and materials into the two
slots on the left. The slot on the right will show you the result, if you do use
the anvil. To complete the repair, click the Anvil button (or just remove the
item from the preview slot).

Below the input slots is the skill slot. This simply shows you your skill with the
anvil. This is indicated by an increasing number of higher value items:

Steel Ingots
Bronze Ingots
Mese Crystals
Diamonds

Once you reach 99 Diamonds (399), that is the upper limit. You cannot improve any
further.

To repair wood or stone items, you simply need wood planks or cobblestone for raw
materials. As those are low level items, they repair quickly, but they also level
your skill slowly. Diamond items are high level items and require a lot of skill 
to repair efficiently, though they give you a larger skill boost when you use them.

The amount that one piece of raw material can repair an item also depends on how
much of that material it normally needs. A shovel, for example, only requires one
piece of raw material, so it repairs a lot faster than a chest piece which is made
from eight pieces.

There are points in your smithing skill where it makes sense to use the anvil
because the price of making a new item would start to cost more than simply repairing
the old item:

Steel: 20 Steel
Bronze: 20 Bronze (120)
Mese: 20 Mese (220)
Diamond: 20 Diamond (320)

The above shows the skill level you need to reach the break even point for tools of
that material. For example, to exactly repair a 50% worn diamond sword with
1 diamond, you would require at least 20 Diamond skill (making that level the point
where it is equal in value to simply making a new diamond sword).

At 20 Diamond, you would also be repairing steel items with 250% efficiency. For example,
you could repair an 83% worn steel pick with only 1 steel ingot.

Note that silver is considered the same level as steel, and obsidian is considered
the same level as mese. Mithril is considered the same level as diamond.

--------------------------------------------------
Torches

Torches give you light. The material used for the handle determines the durability
and the spread of the light. A stone torch gives you a torch that has resistance to 
fire, a clay torch can spread light out to a 5 by 5 square around it, while a steel 
torch gives you a light that can spread out to a 7 by 7 block square around it.

--------------------------------------------------
