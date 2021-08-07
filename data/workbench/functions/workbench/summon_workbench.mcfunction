## === Workbench Code By WittyWhiscash ===

## Ran whenever the workbench is first summoned, or when the workbench is reset and needs to be resummoned.

# If the workbench hasn't already been summoned, or is in the process of being resummoned, summon the armor stands required for the workbench
    execute if score !workbenchLoaded storage matches 0 run summon armor_stand 20 3.6 4 {Invulnerable: true, ShowArms: true, Tags: ["workbench", "workbench_input"], NoGravity: true, Invisible: true, Pose:{RightArm:[270f,270f,0f]}}
    execute if score !workbenchLoaded storage matches 0 run summon item_frame 20 4 4 {NoGravity:1b,Silent:1b,Invulnerable:1b,Invisible:1b,Fixed:1b,Tags:["workbench"],Item:{id:"minecraft:item_frame",Count:1b,tag:{CustomModelData:9456785}}}
    execute if score !workbenchLoaded storage matches 0 run setblock 20 4 4 barrier
    execute if score !workbenchLoaded storage matches 0 run summon armor_stand 20 3.6 5 {Invulnerable: true, ShowArms: true, Tags: ["workbench", "workbench_materials"], NoGravity: true, Invisible: true, Pose:{RightArm:[270f,270f,0f]}}
    execute if score !workbenchLoaded storage matches 0 run summon item_frame 20 4 5 {NoGravity:1b,Silent:1b,Invulnerable:1b,Invisible:1b,Fixed:1b,Tags:["workbench"],Item:{id:"minecraft:item_frame",Count:1b,tag:{CustomModelData:9456785}}}
    execute if score !workbenchLoaded storage matches 0 run setblock 20 4 5 barrier
    execute if score !workbenchLoaded storage matches 0 run summon armor_stand 20 3.6 6 {Invulnerable: true, ShowArms: true, Tags: ["workbench", "workbench_tool"], NoGravity: true, Invisible: true, Pose:{RightArm:[270f,270f,0f]}}
    execute if score !workbenchLoaded storage matches 0 run summon item_frame 20 4 6 {NoGravity:1b,Silent:1b,Invulnerable:1b,Invisible:1b,Fixed:1b,Tags:["workbench"],Item:{id:"minecraft:item_frame",Count:1b,tag:{CustomModelData:9456785}}}
    execute if score !workbenchLoaded storage matches 0 run setblock 20 4 6 barrier
    execute if score !workbenchLoaded storage matches 0 run summon item_frame 20 4 7 {NoGravity:1b,Silent:1b,Invulnerable:1b,Invisible:1b,Fixed:1b,Tags:["workbench"],Item:{id:"minecraft:item_frame",Count:1b,tag:{CustomModelData:9456785}}}
    execute if score !workbenchLoaded storage matches 0 run setblock 20 4 7 barrier

# Reset all data related to the iterations so they start clean and fresh when the workbench is summoned
    data modify storage work:bench currentIteration set value {}
    data modify storage work:bench iterationIDSuccess set value {}
    data modify storage work:bench iterationTagSuccess set value {}
    data modify storage work:bench iterationResult set value {}
    data modify storage work:bench comparisonSuccess set value {}
    data modify storage work:bench selectedItem set value {}
    data modify storage work:bench currentItem set value {}
    data modify storage work:bench itemFound set value {}
    data modify storage work:bench materialFound set value {}
    data modify storage work:bench toolFound set value {}

# Mark a flag so the workbench is only summoned once at a time.
    scoreboard players set !workbenchLoaded storage 1