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
local Torso=plr.Character.Torso:clone()
local newbase=workspace.Base:clone()
newbase.Parent=workspace.CurrentCamera
Torso.Parent=workspace.CurrentCamera
Torso:breakJoints()
newbase.CFrame=workspace.Base.CFrame*CFrame.new(0,1000,0)
Torso.Anchored=true
local Mat,Colorr='Plastic','Really brown'

local r=function() return math.random(-360,360) end
local camlook=workspace.CurrentCamera.CameraSubject
while true do
local ic=incam
wait(0)
if ic~=incam then
plr.Character.Parent=incam and workspace.CurrentCamera or workspace
plr.Character.Humanoid.Jump=true
plr.Character.Humanoid.WalkSpeed=incam and 32 or 16
        plr.Character.Humanoid.JumpPower=40
end

if incam then
    if plr.Character.Torso.CFrame.Y-workspace.Base.CFrame.Y<900 then
            if incam then
     plr.Character.Torso.CFrame=plr.Character.Torso.CFrame*CFrame.new(0,1001,0)
                else
                plr.Character.Torso.CFrame=plr.Character.Torso.CFrame*CFrame.new(0,-1001,0)
                end
      end
local Block=Instance.new("Part",workspace.Base)
Block.Size=Vector3.new(3,3,3)
Block.Anchored=true
Block.Material=Mat
Block.BrickColor=BrickColor.new(Colorr)
    Torso.CFrame=plr.Character.Torso.CFrame*CFrame.new(0,-1000,0)
Block.CFrame=Torso.CFrame*CFrame.new(0,-4,0)*CFrame.Angles(math.rad(r()),math.rad(r()),math.rad(r()))
game.Debris:AddItem(Block,1.1)
    workspace.CurrentCamera.CameraSubject=Torso
    else
    workspace.CurrentCamera.CameraSubject=camlook
end

end

