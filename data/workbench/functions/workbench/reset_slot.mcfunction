## === Workbench Code By WittyWhiscash ===

## Activated when an item is taken out of a slot
## @s -> The armor stand/slot that the item was taken out of

# Remove the output slot
    kill @e[tag=workbench_output]

# Reset the success flag so we can iterate again
    scoreboard players set !success storage 0

# Reset the proper flag for which slot was reset
    execute if entity @s[tag=workbench_input] run scoreboard players set !itemNotFound storage 0
    execute if entity @s[tag=workbench_materials] run scoreboard players set !materialNotFound storage 0
    execute if entity @s[tag=workbench_tool] run scoreboard players set !toolNotFound storage 0

# Reset global item search flags
    scoreboard players set !keysLoaded storage 0
    scoreboard players set !tempItemsLoaded storage 0