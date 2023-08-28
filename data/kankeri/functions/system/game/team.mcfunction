execute store result score *HunterCount Kankeri.System if entity @a[team=Kankeri.Hunter]
execute if score *HunterCount Kankeri.System < *Hunter Kankeri.System run team join Kankeri.Hunter @a[sort=random,limit=1]
execute if score *HunterCount Kankeri.System < *Hunter Kankeri.System run function kankeri:system/game/team