## === Workbench Code By WittyWhiscash ===

## Ran whenever the workbench is first summoned, or when the workbench is reset and needs to be resummoned.

# If the workbench hasn't already been summoned, or is in the process of being resummoned, summon the armor stands required for the workbench
    execute if score !workbenchLoaded storage matches 0 run summon armor_stand 20 4 4 {Invulnerable: true, ShowArms: true, Tags: [workbench, workbench_input]}
    execute if score !workbenchLoaded storage matches 0 run summon armor_stand 20 4 5 {Invulnerable: true, ShowArms: true, Tags: [workbench, workbench_materials]}
    execute if score !workbenchLoaded storage matches 0 run summon armor_stand 20 4 6 {Invulnerable: true, ShowArms: true, Tags: [workbench, workbench_tool]}

# Reset all data related to the iterations so they start clean and fresh when the workbench is summoned
    data modify storage work:bench currentIteration set value {}
    data modify storage work:bench iterationIDSuccess set value {}
    data modify storage work:bench iterationTagSuccess set value {}
    data modify storage work:bench iterationResult set value {}
    data modify storage work:bench comparisonSuccess set value {}
    data modify storage work:bench selectedItem set value {}
    data modify storage work:bench currentItem set value {}

# Mark a flag so the workbench is only summoned once at a time.
    scoreboard players set !workbenchLoaded storage 1