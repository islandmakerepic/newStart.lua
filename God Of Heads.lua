--God of heads--

local headMain=script.Parent.Head:clone()
headMain.Name='HeadAttack'

local char=script.Parent
local plr=game.Players.LocalPlayer
local mouse=plr:GetMouse()

local selected='none'

local attacks = {
['none']=function()
return
end,
['devour']=function(position,target)
  
for i=-25,25,5 do
  wait(0)
local attack=headMain:clone()
attack.Anchored=true
attack.Parent=char
attack.CFrame=char.Torso.CFrame*CFrame.new(i,0,math.random(-15,15))
attack.Material='Neon'
attack:breakJoints()
Instance.new("PointLight",attack)

game.Debris:AddItem(attack,5)
coroutine.wrap(function()
  while attack.Parent==char and wait(0) do
    cf=CFrame.new( (position-(target and target.Position or Vector3.new(0,0,0)) ))
attack.CFrame=CFrame.new(attack.CFrame.p,cf)*CFrame.new(0,0,-2)
    end
  end)()
end

end
}

Clear=function()
selected='none'
end

mouse.Button1Down:connect(function()
attacks[selected](mouse.Hit.p,mouse.Target)
end)

mouse.KeyDown:connect(function(Key)
if Key == 'n' then Clear() 
elseif Key == 't' then
selected='devour'

end
end)
