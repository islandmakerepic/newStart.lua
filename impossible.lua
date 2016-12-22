local plr=game.Players.LocalPlayer
local cyl=Instance.new("Part")
cyl.Size=Vector3.new(4,0.2,4)
cyl.Transparency=0.5
Instance.new("CylinderMesh",cyl)
on=false

local m=plr:GetMouse()
local char=plr.Character
char.Archivable=true
local dupe=char:clone()

local clones={}

m.Button1Down:connect(function()
if on then for i,v in pairs(clones) do v:Destroy() end return end
on=true
for i=-25,25,7.5 do
local nc=dupe:clone()
nc.Parent=workspace
            nc:MoveTo(Vector3.new(0,0,0))
nc:MakeJoints()
nc.Torso.CFrame=char.Torso.CFrame*CFrame.new(i,0,0)
clones[#clones+1]=nc
                                    
for i=1,5 do
 local CLL=cyl:clone()
CLL.Anchored=true
CLL.CanCollide=false
  CLL.CFrame=nc.Torso.CFrame*CFrame.new(0,-1.5+i,0)
game.Debris:AddItem(CLL,0.3)
wait(0)
end

    for i=1,#clones do
      local z=i%2==0 and -i or -i+(math.random(-1,1)*5)
      clones[i].Torso.CFrame=clones[i].Torso.CFrame*CFrame.new(0,0,z)
      end
end)
