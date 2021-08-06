## === Workbench Code By WittyWhiscash ===
## Iteration code by jklw10, modified for use in pack by WittyWhiscash

## Compares the current item that has been iterated over with the item in the armor stand and checks if they match

    # tellraw @a [{"text":"Compared:"},{"storage":"work:bench","nbt":"currentItem"},{"text":" and"},{"storage":"work:bench","nbt":"selectedItem"}]

# /data modify returns a 0 if the items are the same. Otherwise, it returns a 1. Store those in as flags and check if both the id and the tag match
    execute store success score !tagSuccess storage run data modify storage work:bench currentItem.tag set from storage work:bench selectedItem.tag
    execute store success score !idSuccess storage run data modify storage work:bench currentItem.id set from storage work:bench selectedItem.id

# If both match, flip the score around and store it in the success flag so we know we have a match. Otherwise, the success flag remains unset.
    execute if score !idSuccess storage matches 0 if score !tagSuccess storage matches 0 run scoreboard players set !success storage 1
    execute unless score !idSuccess storage matches 0 unless score !tagSuccess storage matches 0 run scoreboard players set !success storage 0
    # tellraw @a [{"text":"currentItem == selectedItem: "},{"score":{"name": "!success","objective": "storage"}}]
