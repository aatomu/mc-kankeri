execute if score *CountDown Kankeri.System matches 120 run title @a title {"text": ">     5     <"}
execute if score *CountDown Kankeri.System matches 120 as @a at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.5
execute if score *CountDown Kankeri.System matches 100 run title @a title {"text": ">>    4    <<"}
execute if score *CountDown Kankeri.System matches 100 as @a at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.5
execute if score *CountDown Kankeri.System matches 80 run title @a title {"text": ">>>   3   <<<"}
execute if score *CountDown Kankeri.System matches 80 as @a at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.5
execute if score *CountDown Kankeri.System matches 60 run title @a title {"text": ">>>>  2  <<<<"}
execute if score *CountDown Kankeri.System matches 60 as @a at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.5
execute if score *CountDown Kankeri.System matches 40 run title @a title {"text": ">>>>> 1 <<<<<"}
execute if score *CountDown Kankeri.System matches 40 as @a at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.5
execute if score *CountDown Kankeri.System matches 20 run title @a title {"text": ">>>>>>0<<<<<<"}
execute if score *CountDown Kankeri.System matches 20 as @a at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.5
execute if score *CountDown Kankeri.System matches 0 run title @a title {"text": "Start!"}
execute if score *CountDown Kankeri.System matches 0 as @a at @s run playsound minecraft:entity.ender_dragon.ambient master @s ~ ~ ~ 1 1
execute if score *CountDown Kankeri.System matches 0 run function kankeri:system/game/start

scoreboard players remove *CountDown Kankeri.System 1