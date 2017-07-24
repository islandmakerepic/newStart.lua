local p=game.Players.LocalPlayer
local c=p.Character
local m=p:GetMouse()
local dmg=function(h)
if h.Parent:findFirstChild"Humanoid" and h.Parent~=c then
h.Parent.Humanoid.Health=h.Parent.Humanoid.Health-10
end
end

local SPIKE=function(spot)
local size=math.random(5,25)
local spik=Instance.new("Part",workspace)
spik.Size=Vector3.new(size/3,1,size/3)
spik.CFrame=spot
spik.Touched:connect(dmg)
for i=1,size do
spik.Size=spik.Size+Vector3.new(0,1,0)
spik.CFrame=spot*CFrame.new(0,0.5*i,0)
wait(0)
end
wait(0.5)
for i=size,0,-1 do
spik.Size=spik.Size+Vector3.new(0,-1,0)
spik.CFrame=spot*CFrame.new(0,0.5*i,0)
wait(0)
end
game.Debris:AddItem(spik,0.1)
end

m.Button1Down:connect(function()
local curr=c.HumanoidRootPart.CFrame
for i=1,math.random(5,30) do
coroutine.wrap(function() SPIKE(curr*CFrame.new(math.random(-50,50),0,math.random(-50,50) ) ) end)()
wait(math.random(0,10)/10)
end
end)
