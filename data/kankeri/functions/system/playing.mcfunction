#時間処理
scoreboard players remove *GameTimer Kankeri.System 1
##ティックを秒に
scoreboard players operation *TimerMin Kankeri.System = *GameTimer Kankeri.System
scoreboard players operation *TimerMin Kankeri.System /= *20 Kankeri.System
scoreboard players operation *TimerMin Kankeri.System /= *60 Kankeri.System
scoreboard players operation *TimerSec Kankeri.System = *GameTimer Kankeri.System
scoreboard players operation *TimerSec Kankeri.System /= *20 Kankeri.System
scoreboard players operation *TimerSec Kankeri.System %= *60 Kankeri.System
##ゼロパディング
execute if score *TimerSec Kankeri.System matches 10.. run data modify entity @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1] CustomName set value '{"text":""}'
execute if score *TimerSec Kankeri.System matches ..9 run data modify entity @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1] CustomName set value '{"text":"0"}'
##ボスバーにテキストを反映
execute if score *GameTimer Kankeri.System >= *TimerYellowTick Kankeri.System run bossbar set kankeri:time name [{"text":"残り時間 ","color":"green","bold": true},{"score":{"name": "*TimerMin","objective": "Kankeri.System"}},{"text":":"},{"selector":"@e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]"},{"score":{"name": "*TimerSec","objective": "Kankeri.System"}}]
execute if score *GameTimer Kankeri.System < *TimerYellowTick Kankeri.System run bossbar set kankeri:time color yellow
execute if score *GameTimer Kankeri.System < *TimerYellowTick Kankeri.System run bossbar set kankeri:time name [{"text":"残り時間 ","color":"yellow","bold": true},{"score":{"name": "*TimerMin","objective": "Kankeri.System"}},{"text":":"},{"selector":"@e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]"},{"score":{"name": "*TimerSec","objective": "Kankeri.System"}}]
execute if score *GameTimer Kankeri.System < *TimerRedTick Kankeri.System run bossbar set kankeri:time color red
execute if score *GameTimer Kankeri.System < *TimerRedTick Kankeri.System run bossbar set kankeri:time name [{"text":"残り時間 ","color":"red","bold": true},{"score":{"name": "*TimerMin","objective": "Kankeri.System"}},{"text":":"},{"selector":"@e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]"},{"score":{"name": "*TimerSec","objective": "Kankeri.System"}}]
##ボスバーに数値を反映
execute store result bossbar kankeri:time value run scoreboard players get *GameTimer Kankeri.System

#鬼
##束縛判定
execute if entity @e[type=interaction,tag=Kankeri.Can.Interact,tag=!Kankeri.Can.Dropped] as @a[team=Kankeri.Player,tag=!Kankeri.Game.Bind] at @s on attacker if entity @s[team=Kankeri.Hunter] as @p run function kankeri:system/bind
execute if entity @e[type=interaction,tag=Kankeri.Can.Interact,tag=Kankeri.Can.Dropped] as @a[team=Kankeri.Player,tag=!Kankeri.Game.Bind] at @s on attacker if entity @s[team=Kankeri.Hunter] as @p run effect give @s blindness 10 0 true
##勝利判定
execute unless entity @a[team=Kankeri.Player,tag=!Kankeri.Game.Bind] run function kankeri:system/game/win_hunter
##PlayerFinder
execute as @a[team=Kankeri.Hunter,nbt={SelectedItem:{tag:{isPlayerFinder:1b}}}] run function kankeri:system/player_finder
##エフェクト
execute as @a[team=Kankeri.Hunter] at @s if entity @a[team=Kankeri.Player,tag=!Kankeri.Game.Bind,distance=200..] run effect give @s speed 1 8 true
execute as @a[team=Kankeri.Hunter] at @s if entity @a[team=Kankeri.Player,tag=!Kankeri.Game.Bind,distance=100..] run effect give @s speed 1 5 true
execute as @a[team=Kankeri.Hunter] at @s if entity @a[team=Kankeri.Player,tag=!Kankeri.Game.Bind,distance=10..] run effect give @s speed 1 3 true
##円のマーカー
execute as @a[team=Kankeri.Hunter] at @s facing entity @e[type=armor_stand,tag=Kankeri.Can.Center] feet rotated ~ 0 run particle dust 1 0 1 0.5 ^ ^1 ^1.5 0 0 0 0 10 force @s
#子
##勝利判定
execute if score *GameTimer Kankeri.System matches 0 run function kankeri:system/game/win_player
##拘束処理
execute as @a[team=Kankeri.Player,tag=Kankeri.Game.Bind] at @s unless entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..3] run tp @s @e[type=armor_stand,tag=Kankeri.Can.Center,limit=1]
##もくもく
execute as @e[type=area_effect_cloud,nbt={Effects:[{Duration:200,Id:14}]}] at @s run particle minecraft:campfire_signal_smoke ~ ~ ~ 5 5 5 0 50 force @a

#缶の判定
##蹴り
execute as @e[type=interaction,tag=Kankeri.Can.Interact] at @s unless data entity @s attack{timestamp:0L} on attacker if entity @s[team=Kankeri.Hunter] at @s rotated ~ ~-50 run function kankeri:system/can/motion
execute as @e[type=interaction,tag=Kankeri.Can.Interact] at @s if entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..10] unless data entity @s attack{timestamp:0L} on attacker if entity @s[team=Kankeri.Player,tag=!Kankeri.Game.Bind] at @s rotated ~ ~-30 run function kankeri:system/can/motion
execute as @e[type=interaction,tag=Kankeri.Can.Interact] at @s unless data entity @s attack{timestamp:0L} run data modify entity @s attack.timestamp set value 0L
##子の脱出判定
execute as @e[type=interaction,tag=Kankeri.Can.Interact,tag=!Kankeri.Can.Dropped] at @s unless entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..2] on attacker run tellraw @a [{"selector":"@s"},{"text":  " は 缶 を 蹴り飛ばした!"}]
execute as @e[type=interaction,tag=Kankeri.Can.Interact,tag=!Kankeri.Can.Dropped] at @s unless entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..2] run tag @a[team=Kankeri.Player,tag=Kankeri.Game.Bind] remove Kankeri.Game.Bind
execute as @e[type=interaction,tag=Kankeri.Can.Interact,tag=!Kankeri.Can.Dropped] at @s unless entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..2] run tag @s add Kankeri.Can.Dropped
##缶の戻し判定
execute as @e[type=interaction,tag=Kankeri.Can.Interact,tag=Kankeri.Can.Dropped] at @s if entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..2] on attacker run tellraw @a [{"selector":"@s"},{"text":  " は 缶 を 元に戻した!"}]
execute as @e[type=interaction,tag=Kankeri.Can.Interact,tag=Kankeri.Can.Dropped] at @s if entity @e[type=armor_stand,tag=Kankeri.Can.Center,distance=..2] run tag @s remove Kankeri.Can.Dropped
