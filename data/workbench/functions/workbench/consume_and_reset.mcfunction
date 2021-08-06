## === Workbench Code By WittyWhiscash ===

## Ran whenever the workbench output has been taken

# Reset related scores to reset the workbench as a whole
    scoreboard players set !workbenchLoaded storage 0
    scoreboard players set !success storage 0
    scoreboard players set !itemNotFound storage 0
    scoreboard players set !materialNotFound storage 0
    scoreboard players set !itemNotFound storage 0

# Remove and resummon the workbench
    kill @e[tag=workbench]
    function workbench:workbench/summon_workbench