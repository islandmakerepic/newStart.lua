local cyl=Instance.new("Part")
cyl.Shape='Cylinder'
cyl.FormFactor='Custom'
cyl.Size=Vector3.new(1,5,5)

cyl.Parent=workspace
cyl.CFrame=owner.Character.Torso.CFrame*CFrame.new(0,0,-5)*CFrame.Angles(0,math.rad(90),0)
cyl.Anchored=true
