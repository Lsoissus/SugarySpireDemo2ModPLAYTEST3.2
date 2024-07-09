collectID = -4
onebyoneID = -4
index = 0
image_speed = 0.35
depth = 0
var r = -1
while (r == -1 || r == 8)
    r = irandom_range(1, 4)
idlespr = asset_get_index(("spr_candysona" + string(r)))
throwspr = asset_get_index((("spr_candysona" + string(r)) + "_throw"))
sprite_index = idlespr
