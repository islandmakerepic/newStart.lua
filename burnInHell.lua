local Player = game.Players.LocalPlayer
local Character = Player.Character
local Mouse = Player:GetMouse()

local Fly = function(Direction)
  local woah = Instance.new("Part",workspace)
  woah.Size = Vector3.new(15,1,15)
  woah.BrickColor = BrickColor.New'Toothpaste'
  woah.Material = 'Neon'
  woah.Anchored = true
  woah.CFrame = Character.Torso.CFrame*CFrame.new(0,-(2.5),0)
    game.Debris:AddItem(woah,1)

  local crap = Instance.new("Part",workspace)
  crap.CanCollide = false
  crap.Anchored = true
  crap.Shape = 'Ball'
  crap.Size = Vector3.new(10,10,10)
  crap.BrickColor = BrickColor.White()
  crap.Material = 'Neon'
  crap.CFrame = Character.Torso.CFrame*CFrame.new(0,0,10)
    game.Debris:AddItem(crap,2)
      Character.Torso.CFrame = CFrame.new(Character.Torso.CFrame.p,Direction.p)
end

local KeysHeld = {}

Mouse.KeyDown:connect(function(Key)
  KeysHeld[Key] = true
end)

Mouse.KeyUp:connect(function(Key)
  KeysHeld[Key] = false
end)

local RunService = Game:GetService("RunService")

local Check = function()
 if KeysHeld['t'] then
  local Spot  =  Mouse.Hit
    Fly(Spot)
 end
end

RunService.RenderStepped:connect(Check)
