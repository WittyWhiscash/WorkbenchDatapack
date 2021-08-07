## === Workbench Code By WittyWhiscash ===
## Iteration code by jklw10, modified for use in pack by WittyWhiscash

## Ran whenever we are looking for a match within a chest. Compares both the item ID and its tags.
## @s -> The armor stand/slot that is looking for a match

# Reset the current iteration so we can check if the list is empty
    data modify storage work:bench currentIteration set value {}

    # tellraw @a [{"text":"Item List: "},{"storage":"work:bench","nbt":"itemList"}]

# Copy the next item over to the current iteration and store whether we pulled an item from the list or not successfully in data storage
    execute store success storage work:bench iterationSuccess int 1 run data modify storage work:bench currentIteration set from storage work:bench itemList[0]

    # tellraw @a [{"text":"Current Iterable Item ID: "},{"storage":"work:bench","nbt":"currentIteration.id"},{"text":"Current Iterable Item Tag: "},{"storage":"work:bench","nbt":"currentIteration.tag"},{"text":"Current Iterable Item Slot: "},{"storage":"work:bench","nbt":"currentIteration.Slot"},{"text":", Iteration Success: "},{"storage":"work:bench","nbt":"iterationSuccess"}]

# If there's no item (it detects no ID) in the first slot of the list, mark it as a failed match and set some flags so the iteration stops
    execute unless data storage work:bench itemList[0].id run function workbench:comparing/failed_match

# Remove the first item in the list so we don't iterate over it again
    data remove storage work:bench itemList[0]

# If there is an item in the current iteration and a match has been found, copy it over to the current item to compare it to the item we are looking at
    execute if entity @s[tag=workbench_input] if data storage work:bench currentIteration.id if score !itemNotFound storage matches 0 run data modify storage work:bench currentItem.id set from storage work:bench currentIteration.id
    execute if entity @s[tag=workbench_input] if data storage work:bench currentIteration.tag if score !itemNotFound storage matches 0 run data modify storage work:bench currentItem.tag set from storage work:bench currentIteration.tag
    execute if entity @s[tag=workbench_materials] if data storage work:bench currentIteration.id if score !materialNotFound storage matches 0 run data modify storage work:bench currentItem.id set from storage work:bench currentIteration.id
    execute if entity @s[tag=workbench_materials] if data storage work:bench currentIteration.tag if score !materialNotFound storage matches 0 run data modify storage work:bench currentItem.tag set from storage work:bench currentIteration.tag
    execute if entity @s[tag=workbench_tool] if data storage work:bench currentIteration.id if score !toolNotFound storage matches 0 run data modify storage work:bench currentItem.id set from storage work:bench currentIteration.id
    execute if entity @s[tag=workbench_tool] if data storage work:bench currentIteration.tag if score !toolNotFound storage matches 0 run data modify storage work:bench currentItem.tag set from storage work:bench currentIteration.tag

# If we haven't found a match and if an item is found, compare the current item with the selected item
    execute if entity @s[tag=workbench_input] if score !success storage matches 0 if score !itemNotFound storage matches 0 run function workbench:comparing/compare
    execute if entity @s[tag=workbench_materials] if score !success storage matches 0 if score !materialNotFound storage matches 0 run function workbench:comparing/compare
    execute if entity @s[tag=workbench_tool] if score !success storage matches 0 if score !toolNotFound storage matches 0 run function workbench:comparing/compare

# If there was a success and we found a match, set the item list to null so when it tries to iterate once more, it will not compare the selected item to itself
    execute if score !success storage matches 1 run data modify storage work:bench itemList set value []

# If there was a success and we found a match, exit the iteration
    execute if score !success storage matches 1 run function workbench:comparing/exit_iteration

# Otherwise, continue to iterate until we have an empty list
    execute unless score !success storage matches 1 run function workbench:comparing/continue_iteration

