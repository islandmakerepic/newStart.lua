local char=script.Parent
local hum=char.Humanoid
local shh=function(hh)
hum.HipHeight=hh
end

local tor=char.Torso

local flymation=function()
local cf=tor.CFrame
tor.CFrame=cf*CFrame.Angles(-1,0,0)
end

local plr=game.Players.LocalPlayer
local m=plr:GetMouse()
local OMG=0
local flying=false

m.Button1Down:connect(function()
tor.CFrame=CFrame.new(tor.CFrame.p,m.Hit.p)
flying=true
   flymation()
end)
m.Button1Up:connect(function()
flying=false
end)

m.KeyDown:connect(function(k)
if k=='q' then
OMG=OMG+1
elseif k=='e' then
OMG=OMG-1
end
end)

while wait(0) do
if flying then
shh(OMG)
tor.Velocity=tor.CFrame.lookVector*100
else
tor.Velocity=Vector3.new(0,0,0)
end
end
