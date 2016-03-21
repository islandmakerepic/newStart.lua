local Player = game.Players.LocalPlayer
local Character = Player.Character
local Mouse = Player:GetMouse()

local Fly = function(Direction)
  local woah = Instance.new("Part",workspace)
  woah.Size = Vector3.new(15,5,15)
  woah.BrickColor = workspace.Base.BrickColor
  woah.Material = 'Grass'
  woah.Anchored = true
  woah.CFrame = Character.Torso.CFrame*CFrame.new(0,-6,0)
    game.Debris:AddItem(woah,0.4)

  local crap = Instance.new("Part",workspace)
  crap.CanCollide = false
  crap.Anchored = true
  crap.Shape = 'Ball'
  crap.Size = Vector3.new(10,10,10)
  crap.BrickColor = BrickColor.White()
  crap.Material = 'Neon'
  crap.CFrame = Character.Torso.CFrame*CFrame.new(0,0,15)
    game.Debris:AddItem(crap,0.7)
      Character.Torso.CFrame = CFrame.new(Character.Torso.CFrame.p,Direction.p)*CFrame.new(0,0,-5)
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
