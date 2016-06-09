--cylinders, spikes
--possibly wings

local plr = game.Players.LocalPlayer
local char = plr.Character
local arm = char['Right Arm']
arm.Transparency = 1
local Arm = arm:clone()
Arm.Transparency=0
Arm.Size=Vector3.new(Arm.Size.X,Arm.Size.Y/2,Arm.Size.Z)
local Weld=Instance.new("Weld",Arm)
Weld.Part0=Arm
Weld.Part1=char.Head
Weld.C0=CFrame.new(-1.6,0.675,0)*CFrame.Angles(0,0,math.rad(20))
local Arm2=arm:clone()

Arm2.Parent=char
Arm2.Name='Part2'
Arm2.Size=Vector3.new(Arm.Size.X,Arm.Size.Y,Arm.Size.Z)
Arm2.Transparency=0
local Weld2=Instance.new("Weld",Arm2)
Weld2.Part0=Arm
Weld2.Part1=Arm2
Weld2.C0=CFrame.new(0,-1,0)
local c=Instance.new("Part",workspace)
