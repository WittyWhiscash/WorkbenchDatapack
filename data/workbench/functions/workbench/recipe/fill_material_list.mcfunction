## === Workbench Code By WittyWhiscash ===

## Activated when a list of items needs to be found from multiple chests stored as coordinate data in a list
## @s -> The recipe marker that is finding the chests

    # tellraw @a [{"text": "Marker Pos Before Recipe Stack Mod: X:"},{"nbt":"Pos[0]","entity": "@s"},{"text": ", Y:"},{"nbt":"Pos[1]","entity": "@s"},{"text": ", Z:"},{"nbt":"Pos[2]","entity": "@s"}]

# If the recipe marker hasn't been set to the default position, do so now
    execute if score !keysLoaded storage matches 0 run data modify entity @s Pos[0] set from storage work:bench recipeStackKey.x
    execute if score !keysLoaded storage matches 0 run data modify entity @s Pos[1] set from storage work:bench recipeStackKey.y
    execute if score !keysLoaded storage matches 0 run data modify entity @s Pos[2] set from storage work:bench recipeStackKey.z
    # tellraw @a [{"text": "Marker Pos After Recipe Stack Mod: X:"},{"nbt":"Pos[0]","entity": "@s"},{"text": ", Y:"},{"nbt":"Pos[1]","entity": "@s"},{"text": ", Z:"},{"nbt":"Pos[2]","entity": "@s"}]
    execute if score !keysLoaded storage matches 0 run scoreboard players set !keysLoaded storage 1

# Grab all the items from the chest beneath the recipe marker and put them in the item list to be compared
    execute if score !keysLoaded storage matches 1 at @s run function workbench:workbench/recipe/grab_all_items_from_chest

    # tellraw @a [{"text": "Item List: "},{"storage":"work:bench","nbt":"itemList"}]

# Iterate the recipe marker upwards one block
    execute store result score !index storage if score !keysLoaded storage matches 1 run data get entity @s Pos[1]
    execute if score !keysLoaded storage matches 1 run scoreboard players add !index storage 1
    execute store result storage work:bench indexY double 1 if score !keysLoaded storage matches 1 run scoreboard players get !index storage
    execute if score !keysLoaded storage matches 1 run data modify entity @s Pos[1] set from storage work:bench indexY

    # tellraw @a [{"text": "Marker Pos After Iteration Mod: X:"},{"nbt":"Pos[0]","entity": "@s"},{"text": ", Y:"},{"nbt":"Pos[1]","entity": "@s"},{"text": ", Z:"},{"nbt":"Pos[2]","entity": "@s"}]

# Reset related scores and iterate again at the next position if there is a chest below the recipe marker
    execute if score !keysLoaded storage matches 1 at @s if block ~ ~ ~ chest run scoreboard players set !tempItemsLoaded storage 0
    execute if score !keysLoaded storage matches 1 at @s if block ~ ~ ~ chest run function workbench:workbench/recipe/fill_material_list