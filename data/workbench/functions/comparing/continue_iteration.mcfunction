## === Workbench Code By WittyWhiscash ===
## Iteration code by jklw10, modified for use in pack by WittyWhiscash

## Activated at the end of trying to find a match, will continue to iterate if a match isn't found and there still are items in the list
## @s -> The armor stand/slot that is still trying to find a match

    # tellraw @a [{"text":"Iteration success:"},{"storage":"work:bench","nbt":"iterationSuccess"}]

# Only iterate if it found an item in the list and it hasn't failed to find a match yet  
    execute if entity @s[tag=workbench_input] unless score !itemNotFound storage matches 1 if data storage work:bench iterationSuccess run function workbench:comparing/find_match
    execute if entity @s[tag=workbench_materials] unless score !materialNotFound storage matches 1 if data storage work:bench iterationSuccess run function workbench:comparing/find_match
    execute if entity @s[tag=workbench_tool] unless score !toolNotFound storage matches 1 if data storage work:bench iterationSuccess run function workbench:comparing/find_match