local p=game.Players.LocalPlayer
local ch=p.Character
local base=ch.HumanoidRootPart.CFrame
for i=1,200 do
	wait(0)
	F1=Instance.new("Part",workspace.Terrain)
	F1.Name='F1'
	F1.Size=Vector3.new(3,3,10)
	F1.CFrame=ch.Head.CFrame*CFrame.new(0,0,-7)
	F1.Anchored=true
	--F1.CanCollide=false
	ch.Head.Anchored=true
	ch.Head.CFrame=ch.Head.CFrame*CFrame.Angles(0,math.rad(10),0)*CFrame.new(0,3,0)
end
ch.Head.CFrame=F1.CFrame*CFrame.new(0,6,0)
wait(0)
ch.Head.Anchored=false
local FIRE=Instance.new("Part",workspace.Terrain)
FIRE.Size=Vector3.new(3,3,1)
FIRE.Anchored=true
FIRE.CFrame=ch.Head.CFrame*CFrame.new(0,0,-2)
wait(0)
ch.Head.Anchored=true
for i=1,36,0.3 do
FIRE.Size=FIRE.Size+Vector3.new(0,0,0.3)
FIRE.CFrame=ch.Head.CFrame*CFrame.new(0,0,-(2+(i/2)))*CFrame.Angles(0,0,math.rad(5*i))
FIRE.Color=Color3.fromRGB(i*10,(i*10)-10,(i*10)-20)
wait(0)
end

local maketower=function(cf,maxx)
	local block=Instance.new("Part",workspace.Terrain)
	block.CFrame=cf*CFrame.new(0,maxx and 620-maxx or 0,0)
	block.Size=Vector3.new(10,1,3)
	block.Anchored=true
for i=1,maxx or 620,10 do
	block.Size=block.Size+Vector3.new(0,10,0)
	block.CFrame=cf*CFrame.new(0,(i/2),0)
	wait()
end
end
wait(2)
for i=1,350,10 do
	coroutine.wrap(function() maketower(CFrame.new(base.p)*CFrame.Angles(0,math.rad(i),0)*CFrame.new(0,0,-50)) end)()
	wait(0.2)
end
maketower(CFrame.new(base.p)*CFrame.Angles(0,math.rad(358),0)*CFrame.new(0,0,-50),610)
