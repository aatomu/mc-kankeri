# ボスバー
scoreboard players operation *TimerMin Kankeri.System = *GameTimer Kankeri.System
scoreboard players operation *TimerMin Kankeri.System /= *20 Kankeri.System
scoreboard players operation *TimerMin Kankeri.System /= *60 Kankeri.System
scoreboard players operation *TimerSec Kankeri.System = *GameTimer Kankeri.System
scoreboard players operation *TimerSec Kankeri.System /= *20 Kankeri.System
scoreboard players operation *TimerSec Kankeri.System %= *60 Kankeri.System

execute if score *TimerSec Kankeri.System matches 10.. run data modify entity @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1] CustomName set value '{"text":""}'
execute if score *TimerSec Kankeri.System matches ..9 run data modify entity @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1] CustomName set value '{"text":"0"}'

execute if score *GameTimer Kankeri.System >= *TimerYellowTick Kankeri.System run bossbar set kankeri:time name [{"text":"残り時間 ","color":"green","bold": true},{"score":{"name": "*TimerMin","objective": "Kankeri.System"}},{"text":":"},{"selector":"@e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]"},{"score":{"name": "*TimerSec","objective": "Kankeri.System"}}]
execute if score *GameTimer Kankeri.System < *TimerYellowTick Kankeri.System run bossbar set kankeri:time color yellow
execute if score *GameTimer Kankeri.System < *TimerYellowTick Kankeri.System run bossbar set kankeri:time name [{"text":"残り時間 ","color":"yellow","bold": true},{"score":{"name": "*TimerMin","objective": "Kankeri.System"}},{"text":":"},{"selector":"@e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]"},{"score":{"name": "*TimerSec","objective": "Kankeri.System"}}]
execute if score *GameTimer Kankeri.System < *TimerRedTick Kankeri.System run bossbar set kankeri:time color red
execute if score *GameTimer Kankeri.System < *TimerRedTick Kankeri.System run bossbar set kankeri:time name [{"text":"残り時間 ","color":"red","bold": true},{"score":{"name": "*TimerMin","objective": "Kankeri.System"}},{"text":":"},{"selector":"@e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]"},{"score":{"name": "*TimerSec","objective": "Kankeri.System"}}]

execute store result bossbar kankeri:time value run scoreboard players get *GameTimer Kankeri.System

#鬼の判定
execute as @a[team=Kankeri.Hunter] on target if entity @s[team=Kankeri.Player,tag=!Kankeri.Game.Bind] run tellraw @a [{"selector":"@s"},{"text": "は 鬼 に 捕まった!"}]
execute as @a[team=Kankeri.Hunter] on target if entity @s[team=Kankeri.Player,tag=!Kankeri.Game.Bind] run tag @s add Kankeri.Game.Bind
#鬼の勝利判定
execute unless entity @a[team=Kankeri.Player,tag=!Kankeri.Game.Bind] run function kankeri:system/game/win_hunter

#逃げの判定
execute as @a[team=Kankeri.Player,tag=!Kankeri.Game.Ignore] at @s if entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..0.5] run tellraw @a [{"selector":"@s"},{"text": "は 子 を 解放した!"}]
execute as @a[team=Kankeri.Player,tag=!Kankeri.Game.Ignore] at @s if entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..0.5] run tag @a[team=Kankeri.Player,tag=Kankeri.Game.Bind] remove Kankeri.Game.Bind
execute as @a[team=Kankeri.Player,tag=!Kankeri.Game.Ignore] at @s if entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..0.5] run tag @s add Kankeri.Game.Ignore
execute as @a[team=Kankeri.Player,tag=Kankeri.Game.Ignore] at @s unless entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..0.5] run tag @s remove Kankeri.Game.Ignore
#逃げの勝利判定
execute if score *GameTimer Kankeri.System matches 0 run function kankeri:system/game/win_player

#逃げの拘束
execute as @a[team=Kankeri.Player,tag=Kankeri.Game.Bind] at @s unless entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..3] run tp @s @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]

#もくもく
execute as @e[type=area_effect_cloud,nbt={Effects:[{Duration:200,Id:15}]}] at @s run particle minecraft:campfire_signal_smoke ~ ~ ~ 2 2 2 0 20 force @a
scoreboard players remove *GameTimer Kankeri.System 1