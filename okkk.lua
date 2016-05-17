local follow=function(o,o2)
cf=o2.Parent.Torso.CFrame*CFrame.new(4,0,0)
o:MoveTo(cf.p,o2.Parent.Torso)
end
local find=function(str)
for i,v in pairs(workspace:children()) do
if v.Name:lower():sub(1,#str)==str:lower() then
return v end
end
end

local plr = game.Players.LocalPlayer
local chat=function(m)
if m:sub(1,3)=='fo/' then
pcall(function()
follow(find(m:sub(4)).Humanoid,plr.Character.Humanoid)
end)
end
end

plr.Chatted:connect(chat)
