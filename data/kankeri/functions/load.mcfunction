#通知
tellraw @a {"text":"Kankeri Datapack Is Loaded"}
tellraw @a {"text":"Main Creator: @atomu21263"}
tellraw @a {"text":"Commands:"}
tellraw @a {"text":"/scoreboard players set *HunterPlayer <Count>"}
tellraw @a {"text":"> 鬼の人数を指定する"}
tellraw @a {"text":"/function kankeri:game/place"}
tellraw @a {"text":"> 缶を設置する"}
tellraw @a {"text":"/team join Kankeri.Player <Selector>"}
tellraw @a {"text":"> ゲームを開始する"}
tellraw @a {"text":"/function kankeri:game/start"}
tellraw @a {"text":"> ゲームを開始する"}
tellraw @a {"text":"/function kankeri:game/remove"}
tellraw @a {"text":"> 缶を削除する"}


#スコアボード
scoreboard objectives add Kankeri.System dummy
scoreboard players set *20 Kankeri.System 20
scoreboard players set *60 Kankeri.System 60

scoreboard players set *HunterPlayer Kankeri.System 4

scoreboard players set *GameTimeMin Kankeri.System 10
scoreboard players set *GameTimeSec Kankeri.System 0

scoreboard players add *IsCanPlaced Kankeri.System 0

scoreboard players set *CountDown Kankeri.System 0
scoreboard players set *GameTimer Kankeri.System 0

#チーム
team add Kankeri.Hunter "鬼"
team modify Kankeri.Hunter color red
team modify Kankeri.Hunter friendlyFire false

team add Kankeri.Player "子"
team modify Kankeri.Player color green
team modify Kankeri.Player friendlyFire false


#ボスバー
bossbar add kankeri:time ""