## === Workbench Code By WittyWhiscash ===
## Iteration code by jklw10, modified for use in pack by WittyWhiscash

## Activated when there isn't a match and there is no items in the list
## @s -> The armor stand/slot that failed to find a match

# If there isn't a successful match, then basically set the result to null
    execute if score !success storage matches 0 run data modify storage work:bench iterationResult.id set from storage work:bench itemList[0].id
    execute if score !success storage matches 0 run data modify storage work:bench iterationResult.tag set from storage work:bench itemList[0].tag
    execute if score !success storage matches 0 run data modify storage work:bench iterationResult.Slot set from storage work:bench currentIteration.Slot

# Set the flags so the item / material / tool cannot be iterated over again.
    execute if entity @s[tag=workbench_input] run scoreboard players set !itemNotFound storage 1
    execute if entity @s[tag=workbench_materials] run scoreboard players set !materialNotFound storage 1
    execute if entity @s[tag=workbench_tool] run scoreboard players set !toolNotFound storage 1

# Reset comparison flags
    scoreboard players set !idSuccess storage 0
    scoreboard players set !tagSuccess storage 0

    # tellraw @a [{"text":"Failed to find match!"}]
