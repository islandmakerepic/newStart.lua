local cam=workspace.CurrentCamera
local plr=game.Players.LocalPlayer
local gui=plr.PlayerGui
local inbelly={}
local r=function() return math.random(-360,360) end
local Torso=plr.Character.Torso:clone()
local spit=function()
  local chr=inbelly[#inbelly]
  print(chr)
  print(#inbelly)
  if chr then
    chr.Torso.CFrame=Torso.CFrame*CFrame.new(r()/150,1,r()/200)
    chr.Torso.CFrame=chr.Torso.CFrame*CFrame.Angles(math.rad(r()),0,math.rad(r()))
    chr.Torso.Velocity=chr.Torso.CFrame.lookVector*30
    ypcall(function() chr.INMABELLY:Destroy() end)
    inbelly[#inbelly]=nil
    end
  end

local BARREL=Instance.new("Model",workspace)


for i=1,360,36 do
  local part=Instance.new("Part",BARREL)
  part.Size=Vector3.new(36,100,1)
  part.CFrame=CFrame.new(0,1000,5000)*CFrame.Angles(math.rad(i),0,math.rad(90))*CFrame.new(0,0,-54)
  part.Anchored=true
  part.BrickColor=BrickColor.new'Brown'
  part.Material='Grass'
  local closer=part:Clone()
  closer.Parent=part
  closer.Size=Vector3.new(36,2,54)
  closer.CFrame=part.CFrame*CFrame.new(0,50,54/2)
  local closerr=part:Clone()
  closerr.Parent=part
  closerr.Size=Vector3.new(36,2,54)
  closerr.CFrame=part.CFrame*CFrame.new(0,-50,54/2)
end
local COPY=BARREL:Clone()
wait(0.1)
script.Parent=gui


local incam=false

local change=function()
incam=not incam
end

local can=false

local mou=plr:GetMouse()

local Eatt=false


mou.KeyDown:connect(function(K)
    if K=='q' then
      spit()
      elseif K=='e' then
      Eatt=not Eatt
      end
    
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


local newbase=workspace.Base:clone()
newbase.Parent=workspace.CurrentCamera
Torso.Parent=workspace.CurrentCamera
Torso:breakJoints()
Torso.CanCollide=false
Torso.Transparency=1
newbase.CFrame=workspace.Base.CFrame*CFrame.new(0,1000,0)
Torso.Anchored=true
local Mat,Colorr='Grass','Brown'


local Eat=function(CHARAC)
  if not CHARAC:findFirstChild'INMABELLY' then
  CHARAC:MoveTo(BARREL:GetModelCFrame().p)
  CHARAC.Torso.CFrame=CHARAC.Torso.CFrame*CFrame.new(0,20,0)
  Instance.new("Model",CHARAC).Name='INMABELLY'
    if not workspace:findFirstChild'INMABELLY' then
  local AAA=COPY:Clone()
    AAA.Parent=CHARAC
    AAA.Name='INMABELLY'
      end
  inbelly[#inbelly+1]=CHARAC
    end
  end




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
    print(Eatt and 'eating' or 'not')
    print((#inbelly or 0)..' people in stomach')
Block.BrickColor=BrickColor.new(Colorr)
    Block.Touched:connect(function(h)
        if h.Parent:findFirstChild('Humanoid') and Eatt then
          Eat(h.Parent)
          end
        end)
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
