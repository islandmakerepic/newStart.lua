local y=100
local plr=game.Players.LocalPlayer
local m=plr:GetMouse()

local con=function(spot1,spot2,ang)
local laZ=Instance.new("Part",workspace)
local D=(spot1.p-spot2.p).magnitude
laZ.Size=Vector3.new(1,1,D)
local spot2=spot2*CFrame.new(0,ang,0)
laZ.CFrame=CFrame.new(spot1.p,spot2.p)*CFrame.new(0,0,-(D/2))
laZ.Anchored=true
laZ.Transparency=0.25
laZ.BrickColor=BrickColor.Yellow()
return laZ
end

local laz=function(spot1,spot2)
local raypart=Instance.new("Part",workspace)
local dist=(spot1.p-spot2.p).magnitude
raypart.Transparency=1
raypart.Size=Vector3.new(1,1,dist)
raypart.Anchored=true
raypart.CFrame=CFrame.new(spot1.p,spot2.p)*CFrame.new(0,0,-(dist/2))
local num=dist
local cff=raypart.CFrame*CFrame.new(0,0,dist/2)
local ok=8
for i=0,dist,5 do
wait(0)
local n1=-ok
local n2=math.random(n1,ok)
con(cff*CFrame.new(0,0,-i-5),cff*CFrame.new(0,0,-i),n2)
end
end

m.Button1Down:connect(function()
local spot=m.Hit
local cf=CFrame.new(spot.X,y,spot.Z)
local cf2=CFrame.new(spot.X,0,spot.Z+math.random(-10,10))
laz(cf,cf2)
end)
