local Player = game.Players.LocalPlayer
local User = Player.Character
local Cursor = Player:GetMouse()
  User.Archivable=true
local Glitch = User:clone()
local colors={}
  for i,v in pairs(Glitch:GetChildren()) do
if v:IsA'Script' or v:IsA'LocalScript' then v:Destroy() end
  if v:findFirstChild("face") then
    v.face:Destroy()
  end
    if v.Name=='Humanoid' or v:IsA'Hat' or v:IsA'Clothing' then
      v:Destroy() 
    end
    if v:IsA'BasePart' then v.CanCollide=false v.Transparency=0.5 colors[v.Name]=v.BrickColor end
end

for i,v in pairs(User:GetChildren()) do
    if v:IsA'Hat' or v:IsA'Clothing' or v:IsA'CharacterMesh' then v:Destroy() end
  end
local Click = false

local Modes = {"Teleport","Disturb","Run","SwapDeath","GlitchSplode"}

local Mode = Modes[1]

local Pressed = {}

Cursor.KeyDown:connect(function(Key)
  for i,v in pairs(Pressed) do Pressed[i]=false end
  if Pressed[Key] then Pressed[Key]=false else
Pressed[Key] = true end
end)


Cursor.Button1Down:connect(function()
Click = true
end)

Cursor.Button1Up:connect(function()
Click = false
end)
named=function(part,namez)
  for i,v in pairs(namez) do
    if part.Name:lower()==v:lower() then return true end
  end
  return nil
  end
local Teleporting = false

while wait(0) do
  if Pressed['t'] then
    Mode=Modes[1]
  end
  if Pressed['x'] then
    Mode=Modes[2]
  end
  if Pressed['v'] then
    Mode=Modes[3]
  end
  if Pressed['q'] then
    Mode=Modes[4]
  end
  if Pressed['f'] then
    Mode=Modes[5]
    end
  if not Teleporting then
    if Click and Mode==Modes[1] then
    local spot = Cursor.Hit
    Teleporting=true
    local dir=CFrame.new(User.Torso.CFrame.p,spot.p)
    User.Torso.CFrame=dir
    local dist=(spot.p-dir.p).magnitude
    dist=dist<400 and dist or 400
    for i=1,dist,10 do
    User.Torso.CFrame=dir*CFrame.new(0,0,-dist/2)
    local glitch=Glitch:clone()
    glitch.Parent=workspace
    glitch.Torso.CFrame=dir*CFrame.new(0,3,-i)
    glitch.Torso.Anchored=true
    game.Debris:AddItem(glitch,1)
    wait(-1)
  end
  for i=1,10 do
    User.Torso.Anchored=true
    User.Torso.CFrame=dir*CFrame.new(0,2,-dist)
    wait(0)
    User.Torso.Anchored=false
    end
    wait(0)
    Teleporting=false
    end
end
if Mode==Modes[2] then
  if Click then
    User.Torso.BrickColor=BrickColor.Black()
    User.Head.BrickColor=BrickColor.Gray()
    User['Right Arm'].BrickColor=BrickColor.Gray()
    User['Left Arm'].BrickColor=BrickColor.Gray()
    User['Left Leg'].BrickColor=BrickColor.Black()
    User['Right Leg'].BrickColor=BrickColor.Black()
    for i=1,math.random(2,7) do
      local tf=Glitch:Clone()
      tf.Parent=workspace
      tf.Torso.CFrame=User.Torso.CFrame
      *CFrame.new(math.random(-15,10),math.random(-10,10),math.random(-15,25))
      *CFrame.new(0,0,1)
      game.Debris:AddItem(tf,math.random(1,20)/7)
      tf.Torso.Anchored=true
      tf.Torso.Touched:connect(function(h)
        if not named(h,{'Head','Torso','Right Arm','Left Arm',"Right Leg","Left Leg","Base","HumanoidRootPart"}) then
          local dup=h:clone()
          local cf=h.CFrame
          local p = h.Parent
          h:Destroy()
          dup:clearAllChildren()
          dup.Anchored=true
          dup.Parent=p
          dup.CFrame=cf*CFrame.Angles(0,math.rad(180),0)
          dup.Anchored=false
          game.Debris:AddItem(dup,6)
          end
        end)
      end
    else for i,v in pairs(Glitch:children()) do pcall(function() User[v.Name].BrickColor=v.BrickColor end) end
    end
end
if not Click then User.Humanoid.WalkSpeed=20 end
if Mode==Modes[3] and Click then
  User.Humanoid.WalkSpeed=100
  local sp=User.Torso.CFrame
  wait(0)
  local spp=User.Torso.CFrame
  --if (sp.p-spp.p).magnitude>1 then
    local d=(sp.p-spp.p).magnitude
    
    local cl=Glitch:clone()
    cl.Parent=workspace
    cl.Torso.CFrame=sp*CFrame.new(0,0,3)
    cl.Torso.Anchored=true
    for i,v in pairs(cl:children()) do pcall(function() v.Transparency=0 end) end
    game.Debris:AddItem(cl,0.75)
    if math.random(4)==1 then
      cl.Torso.CFrame=cl.Torso.CFrame*CFrame.new(math.random(1,3)==math.random(1,3) and -10 or 10,0,-3)
      if math.random(3)==1 then
        cf1=User.Torso.CFrame
        cf2=cl.Torso.CFrame
        User.Torso.CFrame=cf2
        cl.Torso.CFrame=cf1
        wait(0.2)
        if Click then
        User.Torso.CFrame=cf1
        cl.Torso.CFrame=cf2
        end
      end
      wait(0)
      end
  --end
end
if Mode==Modes[4] and Click then
  if Cursor.Target and not Teleporting then
    local targ=Cursor.Target
    if targ.Parent:findFirstChild'Torso' then
      targ.Parent.Archivable=true
      local CC=targ.Parent:clone()
      local CCC=Instance.new("Model")
      CCC.Name='DeathClone'
      for i,v in pairs(CC:children()) do
        if v.Name~='Head' and v.Name~='Torso' and not v.Name:match'Arm' or v.Name:match'Leg' then
        else
          pcall(function()
          local cccc=v:clone()
          cccc.Parent=CCC
          cccc.CanCollide=false
          cccc.Transparency=0.5
          end)
        end
    end
    local die=targ.Parent
    die.Torso.CFrame=CFrame.new(die.Torso.Position,User.Torso.CFrame.p)
    User.Torso.CFrame=CFrame.new(User.Torso.Position,die.Torso.Position)
    Teleporting=true
    local spot1=die.Torso.CFrame
    local spot2=User.Torso.CFrame
    local d1=(spot1.p-spot2.p).magnitude
    local d2=(spot2.p-spot1.p).magnitude
    local D1=d1/2
    local D2=d2/2
    die.Torso.CFrame=spot1*CFrame.new(0,0,-D1)
    User.Torso.CFrame=spot2*CFrame.new(0,0,-D2)
    coroutine.wrap(function()
    for i=1,d1,5 do
      local gl=CCC:clone()
      gl:MakeJoints()
      gl.Parent=workspace
      gl:MakeJoints()
      
      
      gl.Torso.CFrame=spot1*CFrame.new(0,0,-i)
      gl.Torso.Anchored=true
      game.Debris:AddItem(gl,1)
      wait(0)
    end
    die.Torso.CFrame=spot1*CFrame.new(0,0,-d1)
    die.Torso:breakJoints()
  end)()
  for i=1,d2,5 do
    local gl=Glitch:clone()
    gl.Parent=workspace
    gl.Torso.CFrame=spot2*CFrame.new(0,0,-i)
    game.Debris:AddItem(gl,1)
    wait(0)
  end
  User.Torso.CFrame=spot1
  Teleporting=false
    end
  end
end
if Mode==Modes[5] and Click and not Teleporting then
  local base=User.Torso.CFrame
  Teleporting=true
  for i,v in pairs(User:children()) do
    pcall(function()
      v.BrickColor=BrickColor.Random()
      v.Material='Neon'
      coroutine.wrap(function()
        wait(3)
        v.BrickColor=colors[v.Name]
        v.Material='Plastic'
        end)()
      end)
  end
  User.Torso.CFrame=CFrame.new(Cursor.Hit.p)
  for i=1,100 do
    local osht=Glitch:clone()
    osht.Parent=workspace
    osht.Torso.CFrame=base*CFrame.new(math.random(-10,20),math.random(-10,10),math.random(-25,15))
    *CFrame.Angles(math.rad(math.random(360)),math.rad(360),math.rad(360))
    osht.Torso.Anchored=true
    if math.random(5)==1 then wait(0) end
  coroutine.wrap(function()
    wait(0.5)
    for i=1,20,2 do
      wait(0)
      for i,v in pairs(osht:children()) do
        pcall(function()
      v.BrickColor=BrickColor.Random()
      v.Material='Neon'
      end)
    end
  end
  wait(0)
  osht.Head.BrickColor=BrickColor.Red()
  game.Debris:AddItem(osht,2)
  osht.Torso.Touched:connect(function(h)
    if not named(h,{"Base","Part"}) then
      if h.Parent~=User then
    h.BrickColor=BrickColor.Random()
    h.Size=Vector3.new(math.random(1,10),math.random(2,5),math.random(1,10))
    h.Material='Neon'
    end
    end
    end)
    end)()
  end
  wait(0.1)
Teleporting=false
end
end
