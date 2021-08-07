## === Workbench Code by WittyWhiscash ===

## Activated when the X index of the recipe marker needs to be set
## @s -> The recipe marker who's X position needs to be changed

# Store the current X coord in a temporary variable
execute store result score !positionTemp storage run data get entity @s Pos[0]

# Store the X index we need to add in another temporary variable
execute store result score !index storage run data get storage work:bench itemFound.index

# Multiply the index by two
scoreboard players operation !index storage *= #two storage

# Add the index to the X coord
scoreboard players operation !positionTemp storage += !index storage

# Change the X coord of the marker to this new value
execute store result entity @s Pos[0] double 1 run scoreboard players get !positionTemp storage
