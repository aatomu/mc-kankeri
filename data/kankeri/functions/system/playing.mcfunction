# ボスバー
scoreboard players operation *TimerMin Kankeri.System = *GameTimer Kankeri.System
scoreboard players operation *TimerMin Kankeri.System /= *20 Kankeri.System
scoreboard players operation *TimerMin Kankeri.System /= *60 Kankeri.System
scoreboard players operation *TimerSec Kankeri.System = *GameTimer Kankeri.System
scoreboard players operation *TimerSec Kankeri.System /= *20 Kankeri.System
scoreboard players operation *TimerSec Kankeri.System %= *60 Kankeri.System

execute if score *GameTimer Kankeri.System >= *TimerYellowTick Kankeri.System run bossbar set kankeri:time name [{"text":"残り時間 ","color":"green","bold": true},{"score":{"name": "*TimerMin","objective": "Kankeri.System"}},{"text":":"},{"score":{"name": "*TimerSec","objective": "Kankeri.System"}}]
execute if score *GameTimer Kankeri.System < *TimerYellowTick Kankeri.System run bossbar set kankeri:time color yellow
execute if score *GameTimer Kankeri.System < *TimerYellowTick Kankeri.System run bossbar set kankeri:time name [{"text":"残り時間 ","color":"yellow","bold": true},{"score":{"name": "*TimerMin","objective": "Kankeri.System"}},{"text":":"},{"score":{"name": "*TimerSec","objective": "Kankeri.System"}}]
execute if score *GameTimer Kankeri.System < *TimerRedTick Kankeri.System run bossbar set kankeri:time color red
execute if score *GameTimer Kankeri.System < *TimerRedTick Kankeri.System run bossbar set kankeri:time name [{"text":"残り時間 ","color":"red","bold": true},{"score":{"name": "*TimerMin","objective": "Kankeri.System"}},{"text":":"},{"score":{"name": "*TimerSec","objective": "Kankeri.System"}}]

scoreboard players remove *GameTimer Kankeri.System 1