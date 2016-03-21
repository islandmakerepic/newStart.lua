local Player = game.Players.LocalPlayer
local Character = Player.Character
local Mouse = Player:GetMouse()

local Fly = function(Direction)
local Distance = (Character.Torso.CFrame.Y-workspace.Base.CFrame.Y)
Distance = Distance - 2.5
  local woah = Instance.new("Part",workspace)
  woah.Size = Vector3.new(15,Distance,15)
  woah.BrickColor = workspace.Base.BrickColor
  woah.Material = 'Grass'
  woah.Anchored = true
  woah.CFrame = Character.Torso.CFrame
  woah.CFrame = woah.CFrame* CFrame.new(0,-(Distance/2),0)* CFrame.new(0,-2.5,0)
    game.Debris:AddItem(woah,0.4)

  local crap = Instance.new("Part",workspace)
  crap.CanCollide = false
  crap.Anchored = true
  crap.Shape = 'Ball'
  crap.Size = Vector3.new(10,10,10)
  crap.BrickColor = BrickColor.White()
  crap.Material = 'Neon'
  crap.CFrame = Character.Torso.CFrame*CFrame.new(0,0,20)
    game.Debris:AddItem(crap,0.7)
      Character.Torso.CFrame = CFrame.new(Character.Torso.CFrame.p,Direction.p)*CFrame.new(0,0,-2.5)
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
