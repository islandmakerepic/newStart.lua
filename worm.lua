local cam=workspace.CurrentCamera
local plr=game.Players.LocalPlayer
local gui=plr.PlayerGui
wait(0.1)
script.Parent=gui


local incam=false

local change=function()
incam=not incam
end

local mou=plr:GetMouse()

mou.KeyDown:connect(function(K)
if K=='t' then
change()
end
end)

local Mat,Color='Plastic','Really brown'

local r=function() return math.random(-360,360) end

while true do
local ic=incam
wait(0)
if ic~=incam then
plr.Character.Parent=incam and workspace.CurrentCamera or workspace
plr.Character.Humanoid.Jump=true
plr.Character.Humanoid.WalkSpeed=incam and 32 or 16
end

if incam then
local Block=Instance.new("Part",workspace.Base)
Block.Size=Vector3.new(3,3,3)
Block.Anchored=true
Block.Material=Mat
Block.BrickColor=BrickColor.new(Colorr)
Block.CFrame=plr.Character.Torso.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(math.rad(r()),math.rad(r()),math.rad(r()))
game.Debris:AddItem(Block,1.1)
end

end

