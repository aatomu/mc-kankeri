execute positioned 0.0 0.0 0.0 positioned ^ ^ ^1.5 run summon marker ~ ~ ~ {Tags:["Kankeri.Can.Motion","Kankeri.Can"]}
data modify entity @e[type=armor_stand,tag=Kankeri.Can.Master,limit=1] Motion set from entity @e[type=marker,tag=Kankeri.Can.Motion,limit=1] Pos
kill @e[type=marker,tag=Kankeri.Can.Motion]