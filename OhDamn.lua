local cyl=Instance.new("Part")
cyl.Shape='Cylinder'
cyl.FormFactor='Custom'
cyl.Size=Vector3.new(0.5,2.5,2.5)
local owner=script.Parent
local plr=game.Players[owner.Name]
local cyls={}
local arm=owner['Right Arm']:clone()
arm.Parent=owner
owner['Right Arm']:Destroy()
arm.Size=Vector3.new(1,1,2)
arm.Anchored=true
arm:breakJoints()
local arm2=owner['Left Arm']:clone()
arm2.Parent=owner
arm2.Size=Vector3.new(1,1,2)
arm2.Anchored=true
arm2:breakJoints()
owner['Left Arm']:Destroy()
local hrp=owner['HumanoidRootPart']
local b=owner.Torso.CFrame
for i=-80,80,20 do
hrp.CFrame=b*CFrame.Angles(0,0,math.rad(90))
local c=cyl:clone()
c.Parent=workspace
c.CFrame=owner.Torso.CFrame*CFrame.Angles(0,math.rad(i),0)*CFrame.new(0,0,-10)*CFrame.Angles(0,math.rad(90),0)
c.Anchored=true
arm.CFrame=CFrame.new((owner.Torso.CFrame*CFrame.new(1.3,0,0)).p,(c.CFrame*CFrame.new(1,0,0)).p)*CFrame.new(0,0,-1)
cyls[#cyls+1]=c
wait(0.1)
end

wait(0.5)

for i=#cyls,1,-1 do
  wait(0.1)
local ok=cyls[i]
ok.Material='Neon'
arm2.CFrame=CFrame.new( (owner.Torso.CFrame*CFrame.new(-1.4,0,0)).p , (ok.CFrame*CFrame.new(-1,0,0)).p )*CFrame.new(0,0,-1)
end
