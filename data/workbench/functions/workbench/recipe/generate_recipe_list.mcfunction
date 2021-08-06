## === Workbench Code By WittyWhiscash ===

## Activated when the recipe stack needs to generate a key for finding a match
## @s -> The armor stand/slot that needs to generate a key

# If the recipe marker has not been summoned yet, summon it
    execute if score !recipeMarkerLoaded storage matches 0 run summon armor_stand ~ ~ ~ {CustomName: '{"text":"Recipe Marker"}', CustomNameVisible: true, Tags: [recipe_finder], NoGravity: true}
    execute if score !recipeMarkerLoaded storage matches 0 run scoreboard players set !recipeMarkerLoaded storage 1

# If the recipe marker has been summoned, run the appropriate recipe generation function based on the slot that's calling this function
    execute if entity @s[tag=workbench_input] if score !recipeMarkerLoaded storage matches 1 as @e[limit=1,tag=recipe_finder] anchored feet run function workbench:workbench/recipe/fill_item_list
    execute if entity @s[tag=workbench_materials] if score !recipeMarkerLoaded storage matches 1 as @e[limit=1,tag=recipe_finder] anchored feet run function workbench:workbench/recipe/fill_material_list
    execute if entity @s[tag=workbench_tool] if score !recipeMarkerLoaded storage matches 1 as @e[limit=1,tag=recipe_finder] anchored feet run function workbench:workbench/recipe/fill_tool_list

