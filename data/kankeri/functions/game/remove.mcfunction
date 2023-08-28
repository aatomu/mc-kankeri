execute if score *IsCanPlaced Kankeri.System matches 0 run tellraw @s {"text":"まだ缶が設置されていません","color":"red","bold": true}
execute if score *IsCanPlaced Kankeri.System matches 1 unless entity @e[tag=Kankeri.Can] run tellraw @s {"text":"缶が見つけられませんでした。缶の近くで実行してください","color":"red","bold": true}
execute if score *IsCanPlaced Kankeri.System matches 1 if entity @e[tag=Kankeri.Can] run function kankeri:system/can/remove 
