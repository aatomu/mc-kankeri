#音
execute as @a at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 0.7

#リセット
##ワールド関係
time set day
weather clear
scoreboard players set *GameTimer Kankeri.System -1
scoreboard players set *KickCount Kankeri.System 0
bossbar set kankeri:time players
fill ~15 ~10 ~15 ~-15 ~-5 ~-15 air replace red_stained_glass
##プレイヤー関連
team join Kankeri.Player @a[team=Kankeri.Hunter]
gamemode survival @a[team=Kankeri.Player]
clear @a[team=Kankeri.Player]
effect clear @a[team=Kankeri.Player]
tp @a[team=Kankeri.Player] @e[type=armor_stand,tag=Kankeri.Can.Master,limit=1]