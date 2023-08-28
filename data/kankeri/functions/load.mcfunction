# 通知
tellraw @a {"text":"Kankeri Datapack Has Loaded"}
tellraw @a {"text":"Main Creator: @atomu21263"}
tellraw @a {"text":"Commands:"}
tellraw @a {"text":"/function kankeri:start : ゲームを開始する"}
tellraw @a {"text":"/function kankeri:can   : 缶を入手する"}


#スコアボード
scoreboard objectives add Kankeri.System dummy
scoreboard players set *MaxDefensePlayer Kankeri.System 4
scoreboard players set *MaxAttackPlayer Kankeri.System 1000
scoreboard players set *GameTimeMin Kankeri.System 10
scoreboard players set *GameTimeSec Kankeri.System 0


#チーム
team add Kankeri.Defense "Defense"
team modify Kankeri.Defense color red
team modify Kankeri.Defense friendlyFire false
team modify Kankeri.Defense nametagVisibility hideForOtherTeams

team add Kankeri.Attack "Attack"
team modify Kankeri.Attack color green
team modify Kankeri.Attack friendlyFire false
team modify Kankeri.Attack nametagVisibility never


#ボスバー
bossbar add kankeri:time ""