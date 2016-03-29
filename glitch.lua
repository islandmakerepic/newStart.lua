local Player = game.Players.LocalPlayer
local User = Player.Character
local Cursor = Player:GetMouse()
  User.Archivable=true
local Glitch = User:clone()
  for i,v in pairs(Glitch:GetChildren()) do
if v:IsA'Script' or v:IsA'LocalScript' then v:Destroy() end
  if v:findFirstChild("face") then
    v.face:Destroy()
  end
    if v.Name=='Humanoid' or v:IsA'Hat' or v:IsA'Clothing' then
      v:Destroy() 
    end
    if v:IsA'BasePart' then v.CanCollide=false v.Transparency=0.5 end
end

for i,v in pairs(User:GetChildren()) do
    if v:IsA'Hat' or v:IsA'Clothing' or v:IsA'CharacterMesh' then v:Destroy() end
  end
local Click = false

local Modes = {"Teleport","Disturb","Run"}

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

local Teleporting = false

while wait(0) do
  if Pressed['t'] then
    Mode=Modes[1]
  end
  if Pressed['x'] then
    Mode=Modes[2]
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
    User.Torso.CFrame=dir*CFrame.new(0,2,-dist)
    wait(0.5)
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
    for i=1,math.random(2,4) do
      local tf=Glitch:Clone()
      tf.Parent=workspace
      tf.Torso.CFrame=User.Torso.CFrame
      *CFrame.new(math.random(-50,50),math.random(-10,10),math.random(-30,40))
      *CFrame.new(0,0,-3)
      game.Debris:AddItem(tf,math.random(1,20)/7)
      end
    else for i,v in pairs(Glitch:children()) do pcall(function() User[v.Name].BrickColor=v.BrickColor end) end
    end
  end
end
