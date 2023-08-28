#秒をtickに
scoreboard players operation *GameTimer Kankeri.System = *GameTimeSec Kankeri.System
scoreboard players operation *GameTimer Kankeri.System *= *20 Kankeri.System

#ボスバー設定
execute store result bossbar kankeri:time max run scoreboard players get *GameTimer Kankeri.System
bossbar set kankeri:time color green
bossbar set kankeri:time players @a

#チーム割り当て
function kankeri:system/game/team

#逃げ アイテム
give @a[team=Kankeri.Player] lingering_potion{display:{Name:'{"text": "盲目の残留ポーション","color":"gray","bold": true,"italic": false}'},CustomPotionEffects:[{Id:15,Amplifier:0b,Duration:200}],CustomPotionColor:0} 3
give @a[team=Kankeri.Player] stick{display:{Name:'{"text": "KnockBack Stick","color":"gold","bold": true,"italic": false}'},Enchantments:[{id:"minecraft:knockback",lvl:5s}]} 1
#逃げ エフェクト
effect give @a[team=Kankeri.Player] resistance infinite 127 true
#逃げ 解放Ignore
tag @a[team=Kankeri.Player] add Kankeri.Game.Ignore

#鬼 エフェクト
effect give @a[team=Kankeri.Hunter] resistance infinite 127 true
effect give @a[team=Kankeri.Hunter] blindness 10 0 true
effect give @a[team=Kankeri.Hunter] darkness 10 0 true
effect give @a[team=Kankeri.Hunter] slowness 5 127 true
effect give @a[team=Kankeri.Hunter] weakness 10 127 true
#鬼 アイテム
loot give @a loot kankeri:player_finder
give @a[team=Kankeri.Hunter] bow{Unbreakable:1b,Enchantments:[{id:"minecraft:infinity",lvl:1s}]}
give @a[team=Kankeri.Hunter] arrow 1
give @a[team=Kankeri.Hunter] red_stained_glass 128

#全員TP
tp @a[team=Kankeri.Hunter] @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]
tp @a[team=Kankeri.Player] @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]