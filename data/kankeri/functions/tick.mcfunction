#缶関係
##円の表示
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run tp @s ~ ~ ~ ~7 ~
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run particle end_rod ^ ^0.1 ^2.5 0 0 0 0 10 force @a
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s rotated ~180 ~ run particle end_rod ^ ^0.1 ^2.5 0 0 0 0 10 force @a
##周囲の保護
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run fill ~4 ~3 ~4 ~-4 ~ ~-4 air destroy
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run fill ~2 ~-1 ~2 ~-2 ~-1 ~-2 bedrock replace air

#ゲーム関係
##プレイヤーカウンター
execute store result score *PlayerCount Kankeri.System if entity @a[team=Kankeri.Player]
##カウントダウン
execute if score *CountDown Kankeri.System matches 0.. run function kankeri:system/countdown
##缶の蹴りキャンセル
execute if score *GameTimer Kankeri.System matches -1 as @e[type=interaction,tag=Kankeri.Can.Interact] if data entity @s attack run data remove entity @s attack
##ゲームシステム
execute if score *GameTimer Kankeri.System matches 0.. run function kankeri:system/playing
