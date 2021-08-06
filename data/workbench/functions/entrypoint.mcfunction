## === Workbench Code By WittyWhiscash ===

## Activated whenever a workbench (armor stand with the tag "workbench") is right clicked through the advancement in data/workbench/advancements/interacted_with_workbench.json

# If an item is removed from the input slot, remove the output and reset the variables associated with the input slot
    execute unless data entity @e[limit=1,tag=workbench_input] HandItems[0].Count as @e[limit=1,tag=workbench_input] run function workbench:workbench/reset_slot

# If an item is removed from the material slot, remove the output and reset the variables associated with the material slot
    execute unless data entity @e[limit=1,tag=workbench_materials] HandItems[0].Count as @e[limit=1,tag=workbench_materials] run function workbench:workbench/reset_slot

# If an item is removed from the tool slot, remove the output and reset the veriables associated with the tool slot
    execute unless data entity @e[limit=1,tag=workbench_tool] HandItems[0].Count as @e[limit=1,tag=workbench_tool] run function workbench:workbench/reset_slot

# If an item is removed from the output slot, move to consume all the other slots and reset the table
    execute unless data entity @e[limit=1,tag=workbench_output] HandItems[0].Count run function workbench:workbench/consume_and_reset

# If an item is added to the input slot, search through the key chest to find the matching item and reference the recipe needed
    execute if data entity @e[limit=1,tag=workbench_input] HandItems[0].Count as @e[limit=1,tag=workbench_input] run function workbench:workbench/slot_activated

# If an item is added to the material slot, search through the selected recipe to see if the material matches
    execute if data entity @e[limit=1,tag=workbench_materials] HandItems[0].Count as @e[limit=1,tag=workbench_materials] run function workbench:workbench/slot_activated

# If an item is added to the tool slot, search through the selected recipe to see if the tool matches
    execute if data entity @e[limit=1,tag=workbench_tool] HandItems[0].Count as @e[limit=1,tag=workbench_tool] run function workbench:workbench/slot_activated

# If there is an item in every slot needed, and the recipe matches on all three counts, then summon an armor stand with the result (placeholder stone, then modify the data to make it the result item)
    execute if data entity @e[limit=1,tag=workbench_input] HandItems[0].Count if data entity @e[limit=1,tag=workbench_materials] HandItems[0].Count if data entity @e[limit=1,tag=workbench_tool] HandItems[0].Count if score !itemNotFound storage matches 0 if score !materialNotFound storage matches 0 if score !toolNotFound storage matches 0 run summon armor_stand 20 4 7 {Invulnerable: true, ShowArms: true, Tags: [workbench, workbench_output], HandItems: [{id: stone, Count: 1b}, {}]}
    execute if data entity @e[limit=1,tag=workbench_input] HandItems[0].Count if data entity @e[limit=1,tag=workbench_materials] HandItems[0].Count if data entity @e[limit=1,tag=workbench_tool] HandItems[0].Count if score !itemNotFound storage matches 0 if score !materialNotFound storage matches 0 if score !toolNotFound storage matches 0 as @e[tag=recipe_finder] at @e[tag=recipe_finder] run tp @e[tag=recipe_finder] ~ ~ ~1
    execute if data entity @e[limit=1,tag=workbench_input] HandItems[0].Count if data entity @e[limit=1,tag=workbench_materials] HandItems[0].Count if data entity @e[limit=1,tag=workbench_tool] HandItems[0].Count if score !itemNotFound storage matches 0 if score !materialNotFound storage matches 0 if score !toolNotFound storage matches 0 as @e[tag=recipe_finder] at @e[tag=recipe_finder] run data modify storage work:bench result set from block ~ ~ ~ Items[0]
    execute if data entity @e[limit=1,tag=workbench_input] HandItems[0].Count if data entity @e[limit=1,tag=workbench_materials] HandItems[0].Count if data entity @e[limit=1,tag=workbench_tool] HandItems[0].Count if score !itemNotFound storage matches 0 if score !materialNotFound storage matches 0 if score !toolNotFound storage matches 0 as @e[tag=workbench_output] run data modify entity @e[tag=workbench_output,limit=1] HandItems[0].id set from storage work:bench result.id
    execute if data entity @e[limit=1,tag=workbench_input] HandItems[0].Count if data entity @e[limit=1,tag=workbench_materials] HandItems[0].Count if data entity @e[limit=1,tag=workbench_tool] HandItems[0].Count if score !itemNotFound storage matches 0 if score !materialNotFound storage matches 0 if score !toolNotFound storage matches 0 as @e[tag=workbench_output] run data modify entity @e[tag=workbench_output,limit=1] HandItems[0].tag set from storage work:bench result.tag

# Otherwise, if a match isn't found, summon the output slot, but with nothing in it.
    execute if data entity @e[limit=1,tag=workbench_input] HandItems[0].Count if data entity @e[limit=1,tag=workbench_materials] HandItems[0].Count if data entity @e[limit=1,tag=workbench_tool] HandItems[0].Count if score !success storage matches 0 run summon armor_stand 20 4 7 {Invulnerable: true, ShowArms: true, Tags: [workbench, workbench_output], HandItems: [{id: air, Count: 1b}, {}]}

# Revoke the conditional advancement in data/workbench/advancements/interacted_with_workbench.json so it can be activated again
    advancement revoke @s only workbench:interacted_with_workbench