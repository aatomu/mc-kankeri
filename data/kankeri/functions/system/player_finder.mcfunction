#座標読み込み
data modify storage kankeri:_ Pos set value {X:0,Y:0,Z:0}
execute store result storage kankeri:_ Pos.X int 1 run data get entity @p[team=Kankeri.Player,tag=!Kankeri.Game.Bind] Pos[0] 1
execute store result storage kankeri:_ Pos.Y int 1 run data get entity @p[team=Kankeri.Player,tag=!Kankeri.Game.Bind] Pos[1] 1
execute store result storage kankeri:_ Pos.Z int 1 run data get entity @p[team=Kankeri.Player,tag=!Kankeri.Game.Bind] Pos[2] 1
#反映
loot replace entity @s weapon.mainhand loot kankeri:player_finder