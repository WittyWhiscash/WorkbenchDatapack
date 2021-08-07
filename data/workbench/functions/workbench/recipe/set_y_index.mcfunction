## === Workbench Code by WittyWhiscash ===

## Activated when the recipe marker needs to restore the Y index of the material found
## @s -> The marker that needs its Y coordinate set

data modify entity @s Pos[1] set from storage work:bench materialFound.index
# tellraw @a [{"text":"Set Y index!"}]