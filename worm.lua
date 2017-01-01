local cam=workspace.CurrentCamera
local plr=game.Players.LocalPlayer
local gui=plr.PlayerGui


local BARREL=Instance.new("Model",plr.Character)

for i=1,360,36 do
  local part=Instance.new("Part",Barrel)
  part.Size=Vector3.new(36,1,36)
  part.CFrame=CFrame.new(0,1000,0)*CFrame.Angles(0,0,math.rad(i))*CFrame.new(0,0,-18)
  part.Anchored=true
end
cam.CameraSubject=BARREL
wait(0.1)
script.Parent=gui
local r=function() return math.random(-360,360) end

local incam=false

local change=function()
incam=not incam
end

local can=false

local mou=plr:GetMouse()

mou.KeyDown:connect(function(K)
if K=='t' then
change()
                        
if incam==false then
          can=false
plr.Character.Parent=workspace
        local CF=plr.Character.Torso.CFrame*CFrame.new(0,-1000,0)
plr.Character.Torso.CFrame=CF
elseif incam==true then 
      
 for i=1,5 do
  local block=Instance.new("Part",workspace)
        block.Size=Vector3.new(3.5,3.5,3.5)
          block.Anchored=true
          block.CanCollide=false
          block.Material='Grass'
          block.BrickColor=BrickColor.new('Brown')
          block.CFrame=plr.Character.Torso.CFrame*CFrame.new(r()/150,-2+i,0)*CFrame.Angles(math.rad(r()),math.rad(r()),math.rad(r()))
          game.Debris:AddItem(block,0.4)
          wait(0)
  end
        can=true
 plr.Character.Parent=workspace.CurrentCamera
plr.Character.Torso.CFrame=plr.Character.Torso.CFrame*CFrame.new(0,1000,0)
end

end
end)

local Torso=plr.Character.Torso:clone()
local newbase=workspace.Base:clone()
newbase.Parent=workspace.CurrentCamera
Torso.Parent=workspace.CurrentCamera
Torso:breakJoints()
Torso.CanCollide=false
Torso.Transparency=1
newbase.CFrame=workspace.Base.CFrame*CFrame.new(0,1000,0)
Torso.Anchored=true
local Mat,Colorr='Grass','Brown'


local camlook=workspace.CurrentCamera.CameraSubject
local NUM=0
coroutine.wrap(function()
    while true do
      local pos=Torso.Position
      wait(0.15)
      local p2=Torso.Position
      NUM=(pos-p2).magnitude
      end
    end)()

while wait(0) do
plr.Character.Humanoid.WalkSpeed=incam and 50 or 16
plr.Character.Parent=incam and workspace.CurrentCamera or workspace
        
if incam then
plr.Character.Humanoid.JumpPower=100
else
plr.Character.Humanoid.JumpPower=30
end

if incam and can then
local Block=Instance.new("Part",workspace.Base)
Block.Size=Vector3.new(3,3,3)
Block.Anchored=true
Block.Material=Mat
Block.BrickColor=BrickColor.new(Colorr)
   --[[ local cl=Block:Clone()
    cl.Parent=Block
    cl.Size=Vector3.new(3,3,NUM)
    cl.CFrame=CFrame.new((Torso.CFrame*CFrame.new(0,-4.2,-1)).p,(Torso.CFrame*CFrame.new(0,-4.2,-1-NUM)).p)*CFrame.new(0,0,-NUM)]]
    Torso.CFrame=plr.Character.Torso.CFrame*CFrame.new(0,-1000,0)
Block.CFrame=Torso.CFrame*CFrame.new(math.random(-16,13)/10,-4.2,0)*CFrame.Angles(math.rad(r()),math.rad(r()),math.rad(r()))
game.Debris:AddItem(Block,1.1)

    workspace.CurrentCamera.CameraSubject=Torso
    else
    workspace.CurrentCamera.CameraSubject=camlook
end
  
  end
