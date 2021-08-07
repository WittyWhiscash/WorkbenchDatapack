## === Workbench Code By WittyWhiscash ===

## Activated whenever an item is put into the armor stand/slot
## @s -> The armor stand/slot that the item was put into

# Set the list to iterate through to the key chest
    execute if entity @s[tag=workbench_input] run function workbench:workbench/recipe/generate_recipe_list
    execute if entity @s[tag=workbench_materials] run function workbench:workbench/recipe/generate_recipe_list
    execute if entity @s[tag=workbench_tool] run function workbench:workbench/recipe/generate_recipe_list

# Set the item to be found in the list from the from the armor stand
    data modify storage work:bench selectedItem.id set from entity @s HandItems[0].id
    data modify storage work:bench selectedItem.tag set from entity @s HandItems[0].tag

# Search the key chest if the item hasn't already been found 
    execute if entity @s[tag=workbench_input] unless score !itemNotFound storage matches 1 run function workbench:comparing/find_match
    execute if entity @s[tag=workbench_materials] unless score !materialNotFound storage matches 1 run function workbench:comparing/find_match
    execute if entity @s[tag=workbench_tool] unless score !toolNotFound storage matches 1 run function workbench:comparing/find_match

# If a match is found, and there isn't already a match found, store the match in storage
    execute if entity @s[tag=workbench_input] unless data storage work:bench itemFound.id if data storage work:bench iterationResult.id run data modify storage work:bench itemFound.id set from storage work:bench iterationResult.id
    execute if entity @s[tag=workbench_input] unless data storage work:bench itemFound.tag if data storage work:bench iterationResult.tag run data modify storage work:bench itemFound.tag set from storage work:bench iterationResult.tag
    execute if entity @s[tag=workbench_input] unless data storage work:bench itemFound.index if data storage work:bench iterationResult.index run data modify storage work:bench itemFound.index set from storage work:bench iterationResult.index
    execute if entity @s[tag=workbench_materials] unless data storage work:bench materialFound.id if data storage work:bench iterationResult.id run data modify storage work:bench materialFound.id set from storage work:bench iterationResult.id
    execute if entity @s[tag=workbench_materials] unless data storage work:bench materialFound.tag if data storage work:bench iterationResult.tag run data modify storage work:bench materialFound.tag set from storage work:bench iterationResult.tag
    execute if entity @s[tag=workbench_materials] unless data storage work:bench materialFound.index if data storage work:bench iterationResult.index run data modify storage work:bench materialFound.index set from storage work:bench iterationResult.index
    execute if entity @s[tag=workbench_materials] if data storage work:bench materialFound.index as @e[tag=recipe_finder] run function workbench:workbench/recipe/set_y_index
    execute if entity @s[tag=workbench_tool] unless data storage work:bench toolFound.id if data storage work:bench iterationResult.id run data modify storage work:bench materialFound.id set from storage work:bench iterationResult.id
    execute if entity @s[tag=workbench_tool] unless data storage work:bench toolFound.tag if data storage work:bench iterationResult.tag run data modify storage work:bench materialFound.tag set from storage work:bench iterationResult.tag
# Reset the iteration result for the next search 
    execute if entity @s[tag=workbench_input] if data storage work:bench itemFound if data storage work:bench iterationResult run data modify storage work:bench iterationResult set value {}
    execute if entity @s[tag=workbench_materials] if data storage work:bench materialFound if data storage work:bench iterationResult run data modify storage work:bench iterationResult set value {}
    execute if entity @s[tag=workbench_tool] if data storage work:bench toolFound if data storage work:bench iterationResult run data modify storage work:bench iterationResult set value {}

# Reset flags and related data to iteration and finding success
    scoreboard players set !success storage 0
    execute if score !keysLoaded storage matches 1 run scoreboard players set !keysLoaded storage 0
    execute if score !tempItemsLoaded storage matches 1 run scoreboard players set !tempItemsLoaded storage 0
    execute unless score !positionTemp storage matches 0 run scoreboard players set !positionTemp storage 0
    data modify storage work:bench itemList set value []