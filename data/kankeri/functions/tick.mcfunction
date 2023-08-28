# 円を描く
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run tp @s ~ ~ ~ ~7 ~
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run particle end_rod ^ ^0.1 ^2 0 0 0 0 10 force @a
execute as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s rotated ~180 ~ run particle end_rod ^ ^0.1 ^2 0 0 0 0 10 force @a
execute if score *GameTimer Kankeri.System matches 0.. as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s run particle dust 1 0 0 0.5 ^ ^0.1 ^0.5 0 0 0 0 10 force @a[team=Kankeri.Player]
execute if score *GameTimer Kankeri.System matches 0.. as @e[type=armor_stand,tag=Kankeri.Can.Center] at @s rotated ~180 ~ run particle dust 1 0 0 0.5 ^ ^0.1 ^0.5 0 0 0 0 10 force @a[team=Kankeri.Player]

# プレイヤーをナンバリング
execute as @a[team=Kankeri.Player] unless score @s Kankeri.Number = @s Kankeri.Number run function kankeri:system/set_num
#プレイヤーカウント
execute store result score *PlayerCount Kankeri.System if entity @a[team=Kankeri.Player]

# カウントダウン
execute if score *CountDown Kankeri.System matches 0.. run function kankeri:system/countdown
# ゲームタイマー
execute if score *GameTimer Kankeri.System matches 0.. run function kankeri:system/playing
