local Player = game.Players.LocalPlayer
local User = Player.Character
local Cursor = Player:GetMouse()
  User.Archivable=true
local Glitch = User:clone()
  for i,v in pairs(Glitch:GetChildren())
if v:IsA'Script' or v:IsA'LocalScript' then v:Destroy() end
  if v:findFirstChild("face") then
    v.face:Destroy()
  end
    if v.Name=='Humanoid' then
      v:Destroy() 
    end
end
local Click = false

local Modes = {"Teleport","Disturb","Run"}

local Mode = Modes[1]

local Pressed = {}

Cursor.KeyDown:connect(function(Key)
Pressed[Key] = true
end)

Cursor.KeyUp:connect(function(Key)
Pressed[Key] = false
end)

Cursor.MouseButton1Down:connect(function()
Click = true
end)

Cursor.MouseButton1Up:connect(function()
Click = false
end)

local Teleporting = false

while wait(0) do
  if not Teleporting then
    if Click and Mode==Modes[1] then
    local spot = Cursor.Hit
    Teleporting=true
    local dir=CFrame.new(User.Torso.CFrame.p,spot.p)
    User.Torso.CFrame=dir
    local dist=(spot.p-dir.p).magnitude
    for i=1,dist,3 do
    User.Torso.CFrame=dist*CFrame.new(0,0,-dist/2)
    local glitch=Glitch:clone()
    glitch.Parent=workspace
    glitch.Torso.CFrame=dir*CFrame.new(0,0,-i)
    game.Debris:AddItem(glitch,1)
    wait(0)
    end
    User.Torso.CFrame=dist*CFrame.new(0,0,-dist)
    wait(2)
    Teleporting=false
    end
  end
end
