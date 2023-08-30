#缶関係
##円の表示
execute as @e[type=item_display,tag=Kankeri.Can.Display] at @s run tp @s ~ ~ ~ ~7 ~
execute as @e[type=item_display,tag=Kankeri.Can.Display] at @s on vehicle positioned as @s align xz positioned ~0.5 ~ ~0.5 run particle end_rod ^ ^0.1 ^1.5 0 0 0 0 10 force @a
execute as @e[type=item_display,tag=Kankeri.Can.Display] at @s on vehicle positioned as @s align xz positioned ~0.5 ~ ~0.5 rotated ~180 ~ run particle end_rod ^ ^0.1 ^1.5 0 0 0 0 10 force @a
##周囲の保護
execute if score *KickIgnore Kankeri.System matches 1.. as @e[type=armor_stand,tag=Kankeri.Can.Master] at @s run fill ~2 ~3 ~2 ~-2 ~ ~-2 air replace red_stained_glass

#ゲーム関係
##プレイヤーカウンター
execute store result score *PlayerCount Kankeri.System if entity @a[team=Kankeri.Player]
##カウントダウン
execute if score *CountDown Kankeri.System matches 0.. run function kankeri:system/countdown
##ゲームシステム
execute if score *GameTimer Kankeri.System matches 0.. run function kankeri:system/playing
