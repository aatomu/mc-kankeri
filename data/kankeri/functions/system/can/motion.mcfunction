loot spawn ~ ~ ~ loot kankeri:motion
execute store result entity @e[type=armor_stand,tag=Kankeri.Can.Master,limit=1] Motion[0] double 0.5 run data get entity @e[type=item,nbt={Item:{id:"minecraft:knowledge_book",tag:{isCanMotioner:1b}}},limit=1] Motion[0] 100
execute store result entity @e[type=armor_stand,tag=Kankeri.Can.Master,limit=1] Motion[1] double 0.1 run data get entity @e[type=item,nbt={Item:{id:"minecraft:knowledge_book",tag:{isCanMotioner:1b}}},limit=1] Motion[1] 100
execute store result entity @e[type=armor_stand,tag=Kankeri.Can.Master,limit=1] Motion[2] double 0.5 run data get entity @e[type=item,nbt={Item:{id:"minecraft:knowledge_book",tag:{isCanMotioner:1b}}},limit=1] Motion[2] 100
kill @e[type=item,nbt={Item:{id:"minecraft:knowledge_book",tag:{isCanMotioner:1b}}},limit=1]