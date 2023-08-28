#秒をtickに
scoreboard players operation *GameTimer Kankeri.System = *GameTimeSec Kankeri.System
scoreboard players operation *GameTimer Kankeri.System *= *20 Kankeri.System

#ボスバー設定
execute store result bossbar kankeri:time max run scoreboard players get *GameTimer Kankeri.System
bossbar set kankeri:time color green
bossbar set kankeri:time players @a

#チーム割り当て
function kankeri:system/game/team

#逃げにアイテム
give @a[team=Kankeri.Player] lingering_potion{display:{Name:'{"text": "盲目の残留ポーション","color":"gray","bold": true,"italic": false}'},CustomPotionEffects:[{Id:15,Amplifier:0b,Duration:200}],CustomPotionColor:0} 3
#鬼にエフェクト
effect give @a[team=Kankeri.Hunter] blindness 5 0 true
effect give @a[team=Kankeri.Hunter] slowness 5 127 true
effect give @a[team=Kankeri.Hunter] weakness infinite 127 true

#全員TP
tp @a[team=Kankeri.Hunter] @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]
tp @a[team=Kankeri.Player] @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]