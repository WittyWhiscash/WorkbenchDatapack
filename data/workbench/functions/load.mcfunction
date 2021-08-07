## === Workbench Code By WittyWhiscash ===

## Ran whenever the pack is reloaded, or whenever the pack is loaded for the first time

# Kill the workbench, its related entities and blocks if any exist
    kill @e[tag=recipe_finder]
    kill @e[tag=workbench]
    setblock 20 4 4 air
    setblock 20 4 5 air
    setblock 20 4 6 air
    setblock 20 4 7 air

# Set up scoreboard storage flags/variables and initialize them to fake players
    scoreboard objectives add storage dummy
    scoreboard players set !workbenchLoaded storage 0
    scoreboard players set !recipeMarkerLoaded storage 0
    scoreboard players set !keysLoaded storage 0
    scoreboard players set !tempItemsLoaded storage 0
    scoreboard players set !iteration storage 0
    scoreboard players set !positionTemp storage 0
    scoreboard players set !index storage 0
    scoreboard players set !success storage 0
    scoreboard players set !idSuccess storage 0
    scoreboard players set !tagSuccess storage 0
    scoreboard players set !itemNotFound storage 0
    scoreboard players set !lookingForItem storage 0
    scoreboard players set !materialNotFound storage 0
    scoreboard players set !lookingForMaterial storage 0
    scoreboard players set !toolNotFound storage 0
    scoreboard players set !grabbedItemsFromChest storage 0
    scoreboard players set #two storage 2
    scoreboard players set #twenty-seven storage 27
    scoreboard players set #fifty-four storage 54

# Set up initial data structure for the work bench data and initialize them to null values
    data modify storage work:bench currentIteration set value {}
    data modify storage work:bench iterationResult set value {}
    data modify storage work:bench iterationSucess set value {}
    data modify storage work:bench comparisonSuccess set value {}
    data modify storage work:bench selectedItem set value {}
    data modify storage work:bench currentItem set value {}
    data modify storage work:bench currentPosition set value {}
    data modify storage work:bench indexX set value {}
    data modify storage work:bench indexY set value {}
    data modify storage work:bench keyPositionList set value []
    data modify storage work:bench tempItemList set value []
    data modify storage work:bench itemList set value []
    data modify storage work:bench itemFound set value {}
    data modify storage work:bench materialFound set value {}
    data modify storage work:bench toolFound set value {}
    data modify storage work:bench result set value {}

# Set up constant data structure for the work bench data
    data modify storage work:bench keyPos set value [{x: 22.5d, y: 4.0d, z: 2.5d}, {x: 22.5d, y: 5.0d, z: 2.5d}, {x: 22.5d, y: 6.0d, z: 2.5d}]
    data modify storage work:bench recipeStackKey set value {x: 22.5d, y: 4.0d, z: 4.5d}
