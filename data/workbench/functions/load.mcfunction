## === Workbench Code By WittyWhiscash ===

## Ran whenever the pack is reloaded, or whenever the pack is loaded for the first time

# Set up scoreboard storage flags/variables and initialize them to fake players
    scoreboard objectives add storage dummy
    scoreboard players set !workbenchLoaded storage 0
    scoreboard players set !recipeMarkerLoaded storage 0
    scoreboard players set !keysLoaded storage 0
    scoreboard players set !tempItemsLoaded storage 0
    scoreboard players set !positioned storage 0
    scoreboard players set !index storage 0
    scoreboard players set !success storage 0
    scoreboard players set !idSuccess storage 0
    scoreboard players set !tagSuccess storage 0
    scoreboard players set !itemNotFound storage 0
    scoreboard players set !materialNotFound storage 0
    scoreboard players set !toolNotFound storage 0
    scoreboard players set !grabbedItemsFromChest storage 0

# Set up initial data structure for the work bench data and initialize them to null values
    data modify storage work:bench currentIteration set value {}
    data modify storage work:bench iterationResult set value {}
    data modify storage work:bench iterationSucess set value {}
    data modify storage work:bench comparisonSuccess set value {}
    data modify storage work:bench selectedItem set value {}
    data modify storage work:bench currentItem set value {}
    data modify storage work:bench currentPosition set value {}
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
