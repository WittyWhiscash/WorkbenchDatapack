## === Workbench Code by WittyWhiscash ===

## Ran every tick to detect when to summon the workbench

# If the workbench hasn't been loaded and the player is within range of the spot where the workbench is loaded, load the workbench
execute if entity @e[type=player,x=18,y=4,z=3,dx=2,dy=3,dz=2] if score !workbenchLoaded storage matches 0 run function workbench:workbench/summon_workbench


