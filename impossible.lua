local plr=game.Players.LocalPlayer
local cyl=Instance.new("Part")
cyl.Size=Vector3.new(4,0.2,4)
cyl.Transparency=0.5
local GUI=Instance.new("ScreenGui",plr.PlayerGui)
local t=Instance.new("TextLabel",GU)
txt='Viewing '
t.Text=txt..'0'

Instance.new("CylinderMesh",cyl)
cyl.BrickColor=BrickColor.New'Toothpaste'
cyl.Mesh.Scale=Vector3.new(1,1,1)
on=false

local m=plr:GetMouse()
local char=plr.Character
char.Archivable=true
local dupe=char:clone()

local clones={}
local selected=0
m.KeyDown:connect(function(k)
    if #clones==0 then 
      cam.CameraSubject=char.Humanoid 
     return 
    end
    
    if k=='q' then
      if selected==0 then 
        selected=#clones+1
      end
      
      selected=selected-1
    elseif k=='e' then
    if selected>=#clones then 
      selected=-1 
    end
    selected=selected+1
    end
    cam.CameraSubject=clones[i] and clones[i]:findFirstChild'Humanoid' or char.Humanoid
    t.Text=txt..tostring(selected)
end)

m.Button1Down:connect(function()
if on then for i,v in pairs(clones) do v:Destroy() end on=false clones={} return end
on=true

for i=-25,25,7.5 do
                                    wait(0)
local nc=dupe:clone()
nc.Parent=workspace
            nc:MoveTo(Vector3.new(0,0,0))
nc:MakeJoints()
nc.Torso.CFrame=char.Torso.CFrame*CFrame.new(i,0,0)
clones[#clones+1]=nc
  local II=#clones
local z=II%2==0 and -II or -II+(math.random(-1,1)*5)
      clones[II].Torso.CFrame=clones[II].Torso.CFrame*CFrame.new(0,0,z)                  
coroutine.wrap(function()
pcall(function()
for i=1,10 do
 local CLL=cyl:clone()
CLL.Anchored=true
CLL.CanCollide=false
CLL.Parent=workspace
  CLL.CFrame=nc.Torso.CFrame*CFrame.new(0,-3+i/2,0)
game.Debris:AddItem(CLL,0.3)
wait(0)
end
  end)                                               end)()
          end                          






end)
