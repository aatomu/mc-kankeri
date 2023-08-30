#時間管理
##計算
function kankeri:system/game/time
##ボスバー
execute store result bossbar kankeri:time max run scoreboard players get *GameTimer Kankeri.System
bossbar set kankeri:time players @a

#リセット
##ワールド関係
time set day
weather clear
function kankeri:system/can/motion
execute as @e[type=armor_stand,tag=Kankeri.Can.Master] at @s run fill ~5 ~5 ~5 ~-5 ~ ~-5 air
##プレイヤー関連
gamemode survival @a[team=Kankeri.Player]
clear @a[team=Kankeri.Player]
give @a[team=Kankeri.Player] dried_kelp 64
effect clear @a[team=Kankeri.Player]
effect give @a[team=Kankeri.Player] minecraft:saturation 1 127 true
effect give @a[team=Kankeri.Player] minecraft:mining_fatigue 20 127 true
effect give @a[team=Kankeri.Player] minecraft:haste infinite 4 true
effect give @a[team=Kankeri.Player] minecraft:resistance infinite 127 true
tp @a[team=Kankeri.Player] @e[type=armor_stand,tag=Kankeri.Can.Master,limit=1]
###チーム割り当て
function kankeri:system/game/team
execute as @a[team=Kankeri.Hunter] run tellraw @a [{"selector":"@s"},{"text":" は 鬼 になった!"}]
###逃げ関係
####エフェクト
effect give @a[team=Kankeri.Player] minecraft:speed infinite 1 true
####アイテム
#give @a[team=Kankeri.Player] stick{display:{Name:'{"text": "のっくばっく すてぃっく","color":"gold","bold": true,"italic": false}'},Enchantments:[{id:"minecraft:knockback",lvl:5s}]} 1
give @a[team=Kankeri.Player] lingering_potion{display:{Name:'{"text": "もくもく","color":"gray","bold": true,"italic": false}'},CustomPotionEffects:[{Id:14,Amplifier:0b,Duration:400,ShowParticles:false}],CustomPotionColor:0} 5
###鬼関係
####エフェクト
effect give @a[team=Kankeri.Hunter] blindness 10 0 true
effect give @a[team=Kankeri.Hunter] weakness 10 127 true
effect give @a[team=Kankeri.Hunter] minecraft:speed infinite 2 true
####アイテム
give @a[team=Kankeri.Hunter] stick{display:{Name:'{"text": "ノックバック スティック","color":"gold","bold": true,"italic": false}'},Enchantments:[{id:"minecraft:knockback",lvl:10s}]} 1
give @a[team=Kankeri.Hunter] red_stained_glass 512
item replace entity @a[team=Kankeri.Hunter] armor.feet with diamond_boots{Enchantments:[{id:"minecraft:frost_walker",lvl:1s}]} 1