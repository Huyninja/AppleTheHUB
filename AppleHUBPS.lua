local placeId = game.PlaceId
workspace.FallenPartsDestroyHeight = -50000
if placeId == 6152116144 or placeId == 13883279773 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Huyninja/AppleTheHUB/main/map1.lua', true))()
elseif placeId == 11468159863 or placeId == 13881804983 or placeId == 13883059853 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Huyninja/AppleTheHUB/main/map2.lua', true))()
elseif placeId == 5956785391 then -- Menu
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Huyninja/AppleTheHUB/main/menu.lua', true))()
elseif placeId == 11468034852 then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Huyninja/AppleTheHUB/main/mugen.lua', true))()
else
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Huyninja/AppleTheHUB/main/dungeon.lua', true))()
end
