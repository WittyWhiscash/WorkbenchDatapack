### === Workbench Code By WittyWhiscash ===

## Activated when a list of items needs to be found from multiple chests stored as coordinate data in a list
## @s -> The recipe marker that is finding the chests

    # tellraw @a [{"text": "Marker Pos: X:"},{"nbt":"Pos[0]","entity": "@s"},{"text": ", Y:"},{"nbt":"Pos[1]","entity": "@s"},{"text": ", Z:"},{"nbt":"Pos[2]","entity": "@s"}]

# Check if the key positions have been loaded. If not, then load them in
    execute if score !keysLoaded storage matches 0 run data modify storage work:bench keyPositionList set from storage work:bench keyPos
    execute if score !keysLoaded storage matches 0 run scoreboard players set !keysLoaded storage 1

# Pull the latest position coordinates from the key positions, and set the marker's position to those coordinates 
    execute if score !keysLoaded storage matches 1 run data modify storage work:bench currentPosition set from storage work:bench keyPositionList[0]
    execute if score !keysLoaded storage matches 1 run data remove storage work:bench keyPositionList[0]
    execute if score !keysLoaded storage matches 1 run data modify entity @s Pos[0] set from storage work:bench currentPosition.x
    execute if score !keysLoaded storage matches 1 run data modify entity @s Pos[1] set from storage work:bench currentPosition.y
    execute if score !keysLoaded storage matches 1 run data modify entity @s Pos[2] set from storage work:bench currentPosition.z

# Grab all the items from the chest beneath the recipe marker and insert them into the item list to be compared
    execute if score !keysLoaded storage matches 1 at @s run function workbench:workbench/recipe/grab_all_items_from_chest

    # tellraw @a [{"text": "Item List: "},{"storage":"work:bench","nbt":"itemList"}]

# If the key position list has another entry, reset a flag and iterate again 
    execute if score !keysLoaded storage matches 1 if data storage work:bench keyPositionList[0].x run scoreboard players set !tempItemsLoaded storage 0
    execute if score !keysLoaded storage matches 1 if data storage work:bench keyPositionList[0].x run function workbench:workbench/recipe/fill_item_list


