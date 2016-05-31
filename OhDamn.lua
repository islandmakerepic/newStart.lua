local cyl=Instance.new("Part")
cyl.Shape='Cylinder'
cyl.FormFactor='Custom'
cyl.Size=Vector3.new(1,3,3)
local owner=script.Parent
local plr=game.Players[owner.Name]

for i=90,180,30 do
  local c=cyl:clone()
c.Parent=workspace
c.CFrame=owner.Torso.CFrame*CFrame.Angles(0,math.rad(i),0)*CFrame.new(0,4,-6)*CFrame.Angles(0,math.rad(90),0)
c.Anchored=true
wait()
end
