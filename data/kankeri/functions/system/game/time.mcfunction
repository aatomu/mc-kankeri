#時間演算
##ゲーム
scoreboard players operation *GameTimer Kankeri.System = *GameTimeSec Kankeri.System
scoreboard players operation *GameTimer Kankeri.System *= *20 Kankeri.System
##インターバル
scoreboard players operation *KickInterval Kankeri.System = *KickIntervalSec Kankeri.System
scoreboard players operation *KickInterval Kankeri.System *= *20 Kankeri.System
##調整
scoreboard players operation *GameTimer Kankeri.System += *KickInterval Kankeri.System
