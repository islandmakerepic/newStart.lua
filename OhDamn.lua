local cyl=Instance.new("Part")
cyl.Shape='Cylinder'
cyl.FormFactor='Custom'
cyl.Size=Vector3.new(5,1,5)

cyl.Parent=workspace
cyl.CFrame=owner.Character.Torso.CFrame*CFrame.new(0,0,-5)
cyl.Anchored=true
