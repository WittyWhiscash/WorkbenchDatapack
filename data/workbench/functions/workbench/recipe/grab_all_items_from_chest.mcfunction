## === Workbench Code By WittyWhiscash ===

## Activates when a recipe marker grabs all items from a chest
## @s -> The recipe marker that is grabbing the items

# Reset the current iteration to null
    data modify storage work:bench currentIteration set value {}

# If the items haven't been loaded in, set the temporary item list to the items in the chest
    execute store success score !grabbedItemsFromChest storage if score !tempItemsLoaded storage matches 0 run data modify storage work:bench tempItemList set from block ~ ~ ~ Items
    execute if score !tempItemsLoaded storage matches 0 run scoreboard players set !tempItemsLoaded storage 1

# Append the latest item from the chest list to the item list, adding the proper index based on what type of slot we are grabbing for
    execute if score !tempItemsLoaded storage matches 1 run data modify storage work:bench currentIteration set from storage work:bench tempItemList[0]
    execute if score !tempItemsLoaded storage matches 1 run data remove storage work:bench tempItemList[0]
    execute store result storage work:bench currentIteration.index double 1 if score !tempItemsLoaded storage matches 1 if score !iteration storage matches 0 run data get storage work:bench currentIteration.Slot
    execute store result score !positionTemp storage if score !tempItemsLoaded storage matches 1 if score !iteration storage matches 1.. run data get storage work:bench currentIteration.Slot
    execute store result score !positionTemp storage if score !tempItemsLoaded storage matches 1 if score !lookingForItem storage matches 1 if score !iteration storage matches 1 run scoreboard players operation !positionTemp storage += #twenty-seven storage
    execute store result score !positionTemp storage if score !tempItemsLoaded storage matches 1 if score !lookingForItem storage matches 1 if score !iteration storage matches 2 run scoreboard players operation !positionTemp storage += #fifty-four storage
    execute store result score !positionTemp storage if score !tempItemsLoaded storage matches 1 if score !lookingForMaterial storage matches 1 run data get entity @s Pos[1]
    execute if score !tempItemsLoaded storage matches 1 if score !lookingForMaterial storage matches 1 run scoreboard players add !positionTemp storage 1
    execute store result storage work:bench currentIteration.index double 1 if score !tempItemsLoaded storage matches 1 if score !lookingForMaterial storage matches 1 run scoreboard players get !positionTemp storage
    execute store result storage work:bench currentIteration.index double 1 if score !tempItemsLoaded storage matches 1 if score !lookingForItem storage matches 1 if score !iteration storage matches 1.. run scoreboard players get !positionTemp storage
    
    execute if score !tempItemsLoaded storage matches 1 run data modify storage work:bench itemList append from storage work:bench currentIteration
    # tellraw @a [{"storage":"work:bench","nbt":"currentIteration"}]

# If there is another item in the list, run again.
    execute if score !tempItemsLoaded storage matches 1 if data storage work:bench tempItemList[0].id run function workbench:workbench/recipe/grab_all_items_from_chest