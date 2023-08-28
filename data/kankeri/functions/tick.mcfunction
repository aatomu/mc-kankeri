# 円を描く
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run tp @s ~ ~ ~ ~7 ~
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run particle end_rod ^ ^0.1 ^2 0 0 0 0 10 force @a
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s rotated ~180 ~ run particle end_rod ^ ^0.1 ^2 0 0 0 0 10 force @a
