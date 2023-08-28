#缶関係
##円の表示
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run tp @s ~ ~ ~ ~7 ~
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run particle end_rod ^ ^0.1 ^2 0 0 0 0 10 force @a
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s rotated ~180 ~ run particle end_rod ^ ^0.1 ^2 0 0 0 0 10 force @a
##周囲の保護
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run fill ~2 ~2 ~2 ~-2 ~ ~-2 air destroy

#ゲーム関係
##プレイヤーカウンター
execute store result score *PlayerCount Kankeri.System if entity @a[team=Kankeri.Player]
##カウントダウン
execute if score *CountDown Kankeri.System matches 0.. run function kankeri:system/countdown
##ゲームタイマー
execute if score *GameTimer Kankeri.System matches 0.. run function kankeri:system/playing