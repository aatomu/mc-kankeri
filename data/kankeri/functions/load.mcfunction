#通知
tellraw @a {"text":"Kankeri Datapack Is Loaded"}
tellraw @a {"text":"Main Creator  : @aatomu"}
tellraw @a {"text":"Commands,Rule : Check For Advancement."}
tellraw @a {"text":"コマンド,ルール等 : 進捗を確認してください"}


#スコアボード
scoreboard objectives add Kankeri.System dummy
scoreboard objectives add Kankeri.Count dummy "蹴った回数ランキング"
scoreboard objectives setdisplay sidebar Kankeri.Count
##定数
scoreboard players set *2 Kankeri.System 2
scoreboard players set *20 Kankeri.System 20
scoreboard players set *60 Kankeri.System 60
##カウント
scoreboard players set *Hunter Kankeri.System 4
scoreboard players set *HunterCount Kankeri.System 0
scoreboard players set *PlayerCount Kankeri.System 0
##フラグ
scoreboard players add *IsCanPlaced Kankeri.System 0
scoreboard players set *KickCount Kankeri.System 0
##時間
scoreboard players set *CountDown Kankeri.System -1
scoreboard players set *GameTimeSec Kankeri.System 90
scoreboard players set *GameTimer Kankeri.System -1
scoreboard players set *KickIntervalSec Kankeri.System 45
scoreboard players set *KickInterval Kankeri.System -1
##時間のボーダー
scoreboard players set *TimerYellowTick Kankeri.System 600
scoreboard players set *TimerRedTick Kankeri.System 300
scoreboard players set *TimerMin Kankeri.System 0
scoreboard players set *TimerSec Kankeri.System 0

#チーム
##鬼
team remove Kankeri.Hunter
team add Kankeri.Hunter "鬼"
team modify Kankeri.Hunter color red
team modify Kankeri.Hunter friendlyFire false
##子
team remove Kankeri.Player
team add Kankeri.Player "子"
team modify Kankeri.Player color green
team modify Kankeri.Player friendlyFire true

#ボスバー
##時間
bossbar remove kankeri:time
bossbar add kankeri:time ""
bossbar set kankeri:time players