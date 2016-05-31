local cyl=Instance.new("Part")
cyl.Shape='Cylinder'
cyl.FormFactor='Custom'
cyl.Size=Vector3.new(0.5,2.5,2.5)
local owner=script.Parent
local plr=game.Players[owner.Name]
local cyls={}
local arm=owner['Right Arm']
local W=Instance.new("Weld",arm)
W.Part0=arm
W.Part1=owner.Torso
W.C0=CFrame.new(-1.5,-0.5,0)*CFrame.Angles(math.rad(90),math.rad(27),0)*CFrame.new(0,0,-1.5)
for i=-80,80,20 do
  local c=cyl:clone()
c.Parent=workspace
c.CFrame=owner.Torso.CFrame*CFrame.Angles(0,math.rad(i),0)*CFrame.new(0,4,-10)*CFrame.Angles(0,math.rad(90),0)
c.Anchored=true
cyls[#cyls+1]=c
wait(0.1)
end
wait(0.5)
for i=#cyls,1,-1 do
  wait(0.1)
local ok=cyls[i]
ok.Material='Neon'
end
