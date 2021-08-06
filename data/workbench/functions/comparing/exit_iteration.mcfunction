## === Workbench Code By WittyWhiscash ===
## Iteration code by jklw10, modified for use in pack by WittyWhiscash

## Activated when a match is found, sets flags properly
## @s -> The armor stand/slot that found a match

# If a match is found, and it isn't comparing against itself, set the iteration result to the current item being iterated on
    execute if entity @s[tag=workbench_input] if score !success storage matches 1 if score !itemNotFound storage matches 0 run data modify storage work:bench iterationResult.tag set from storage work:bench currentIteration.tag
    execute if entity @s[tag=workbench_input] if score !success storage matches 1 if score !itemNotFound storage matches 0 run data modify storage work:bench iterationResult.id set from storage work:bench currentIteration.id
    execute if entity @s[tag=workbench_materials] if score !success storage matches 1 if score !materialNotFound storage matches 0 run data modify storage work:bench iterationResult.tag set from storage work:bench currentIteration.tag
    execute if entity @s[tag=workbench_materials] if score !success storage matches 1 if score !materialNotFound storage matches 0 run data modify storage work:bench iterationResult.id set from storage work:bench currentIteration.id
    execute if entity @s[tag=workbench_tool] if score !success storage matches 1 if score !toolNotFound storage matches 0 run data modify storage work:bench iterationResult.tag set from storage work:bench currentIteration.tag
    execute if entity @s[tag=workbench_tool] if score !success storage matches 1 if score !toolNotFound storage matches 0 run data modify storage work:bench iterationResult.id set from storage work:bench currentIteration.id

# If there is no success, make the system "think" it found a match so the iteration exits
    execute if entity @s[tag=workbench_input] if score !success storage matches 0 run scoreboard players set !itemNotFound storage 0
    execute if entity @s[tag=workbench_materials] if score !success storage matches 0 run scoreboard players set !itemNotFound storage 0
    execute if entity @s[tag=workbench_tool] if score !success storage matches 0 run scoreboard players set !itemNotFound storage 0

    # tellraw @a [{"text":"Iteration result: "},{"storage":"work:bench","nbt":"iterationResult"}]