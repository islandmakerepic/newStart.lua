local Player = game.Players.LocalPlayer
local Character = Player.Character
local Mouse = Player:GetMouse()

local GetRandom=function()
  return math.random(-360,360)
end
local Cframe = workspace.Base.CFrame
local Size=workspace.Base.Size
local maxX=Cframe.X+Size.X/2
local minX=Cframe.X-Size.X/2

local maxZ=Cframe.Z+Size.Z/2
local minZ=Cframe.Z-Size.Z/2

local Fly = function(Direction)
local Distance = (Character.Torso.CFrame.Y-workspace.Base.CFrame.Y)
Distance = Distance - 2.5
  local woah = Instance.new("Part",workspace)
  woah.Size = Vector3.new(15,Distance,20)
  woah.BrickColor = workspace.Base.BrickColor
  woah.Material = 'Grass'
  woah.Anchored = true
  local CFrameA=Character.Torso.CFrame
  local X, Z = CFrameA.X, CFrameA.Z
  
  if Z<minZ or Z>maxZ or X>maxX or X<minX then
  local DistanceZ = Z
  DistanceZ = DistanceZ-Size.Z/2
  local DistanceX = X
  DistanceX = DistanceX-Size.Z/2
  local Extend = woah:clone()
  Extend.Parent = woah
  Extend.Size = Vector3.new(DistanceX,woah.Size.Y>15 and 15 or woah.Size.Y,DistanceZ)
  local NxtCF = CFrame.new(X,0,Z)
  Extend.CFrame = CFrame.new(NxtCF.p,Cframe.p)*CFrame.new(0,0,-(Extend.Size.Z/2))
  end
  local Base=workspace.Base
  local CF=Base.CFrame
  local Y = CF.Y
  woah.CFrame = CFrame.new(X,Y+(Distance/2),Z)

    game.Debris:AddItem(woah,2)

  local crap = Instance.new("Part",workspace)
  crap.CanCollide = false
  crap.Anchored = true
  crap.Size = Vector3.new(7.5,7.5,7.5)
  crap.BrickColor = BrickColor.White()
  crap.Material = 'Neon'
crap.CFrame = CFrame.new(woah.CFrame.X,3,woah.CFrame.Z)
*CFrame.Angles(math.rad(GetRandom()),math.rad(GetRandom()),math.rad(GetRandom()))
  Instance.new("Fire",crap)
    game.Debris:AddItem(crap,2.25)
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
