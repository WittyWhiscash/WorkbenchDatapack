## === Workbench Code By WittyWhiscash ===

## Activated when a list of items needs to be found from multiple chests stored as coordinate data in a list
## @s -> The recipe marker that is finding the chests

# If the recipe marker is not in position, move it into position
    execute if score !keysLoaded storage matches 0 as @s at @s run tp @s ~ ~-0.15 ~1
    execute if score !keysLoaded storage matches 0 run scoreboard players set !keysLoaded storage 1

# Grab the possible tools used in the recipe and add them to the list to be compared
    execute if score !keysLoaded storage matches 1 at @s run function workbench:workbench/recipe/grab_all_items_from_chest
    execute if score !keysLoaded storage matches 1 run scoreboard players set !tempItemsLoaded storage 0