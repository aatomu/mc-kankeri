#全員TP
tp @a[team=Kankeri.Hunter] @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]
tp @a[team=Kankeri.Player] @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]
#クリア
effect clear @a[team=Kankeri.Hunter]
effect clear @a[team=Kankeri.Player]
clear @a[team=Kankeri.Hunter]
clear @a[team=Kankeri.Player]

#音
execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 0.7

#リセット
team join Kankeri.Player @a[team=Kankeri.Player.Bind]
team join Kankeri.Player @a[team=Kankeri.Hunter]
scoreboard players set *GameTimer Kankeri.System -1
bossbar set kankeri:time players
fill ~10 ~10 ~10 ~-10 ~ ~-10 air replace red_stained_glass
tp @e[type=armor_stand,tag=Kankeri.Can.Master] @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]