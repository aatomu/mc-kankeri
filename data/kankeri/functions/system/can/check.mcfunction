execute if score *KickInterval Kankeri.System matches 0 run fill ~10 ~5 ~10 ~-10 ~-5 ~10 air replace red_stained_glass
execute if score *KickInterval Kankeri.System matches 0 run function kankeri:system/can/motion
execute if score *KickInterval Kankeri.System matches 0 run tellraw @a [{"selector":"@s","bold": true},{"text":" が 缶 をけった!"}]
execute if score *KickInterval Kankeri.System matches 0 run scoreboard players add *KickCount Kankeri.System 1
execute if score *KickInterval Kankeri.System matches 0 run function kankeri:system/game/time