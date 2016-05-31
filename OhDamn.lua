local cyl=Instance.new("Part")
cyl.Shape='Cylinder'
cyl.FormFactor='Custom'
cyl.Size=Vector3.new(1,3,3)
local owner=script.Parent~=workspace and script.Parent or owner
cyl.Parent=workspace
cyl.CFrame=owner.Character.Torso.CFrame*CFrame.new(0,4,-6)*CFrame.Angles(0,math.rad(90),0)
cyl.Anchored=true
