--God of heads--


local headMain=script.Parent.Head:clone()
headMain.Name='HeadAttack'

local char=script.Parent
local plr=game.Players.LocalPlayer
local mouse=plr:GetMouse()

local selected='none'


local Kill=function(pos)
  local cf=CFrame.new(pos)*CFrame.new(0,5,0)
  local death=Instance.new("Part",workspace)
  death.Transparency=1
  death.Size=Vector3.new(10,2,10)
  death.CanCollide=false
  death.CFrame=cf
  death.Touched:connect(function(h)
    if h.Name=='Head' or h.Parent==char then return end
    pcall(function() h.Parent.Humanoid.Health=h.Parent.Humanoid.Health-20 end)
    game.Debris:AddItem(death,0.1)
    end)
end


local attacks = {
['none']=function()
return
end,
['devour']=function(position,target)
  coroutine.wrap(function()
    for i=-25,25,5 do
  if math.random(0,3)==1 then wait(0) end
local attack=headMain:clone()
attack.Anchored=true
attack.Parent=char
attack.CFrame=char.Torso.CFrame*CFrame.new(i,-3,math.random(-15,15))
coroutine.wrap(function()
  for i=0,300,50 do
    wait(0)
    attack.CFrame=attack.CFrame*CFrame.new(0,0.50,0)
    end
  end)()
attack.Material='Neon'
attack:breakJoints()

Instance.new("PointLight",attack)
local diff=(position-attack.CFrame.p).magnitude
--print(diff)
game.Debris:AddItem(attack,(diff/65)+1.5)
coroutine.wrap(function()
  wait((diff/65)+1.48)
  Kill(attack.Position)
  end)()
coroutine.wrap(function()
  wait(1)
  Instance.new("Fire",attack).Color=BrickColor.new'Toothpaste'.Color
  while attack.Parent==char and wait(0) do
    cf=CFrame.new(position)
attack.CFrame=CFrame.new(attack.CFrame.p,(cf*CFrame.new(i/5,0,0)).p)*CFrame.new(i<0 and math.random(0,5)/10 or math.random(-5,0)/10,0,-2)
    end
  end)()
end
end)()
for i=-25,25,5 do
  if math.random(0,3)==1 then wait(0) end
local attack=headMain:clone()
attack.Anchored=true
attack.Parent=char
attack.CFrame=char.Torso.CFrame*CFrame.new(i,-3,math.random(-30,15))
coroutine.wrap(function()
  for i=0,300,50 do
    wait(0)
    attack.CFrame=attack.CFrame*CFrame.new(0,0.50,0)
    end
  end)()
attack.Material='Neon'
attack:breakJoints()

Instance.new("PointLight",attack)
local diff=(position-attack.CFrame.p).magnitude
--print(diff)
game.Debris:AddItem(attack,(diff/65)+1.5)
coroutine.wrap(function()
  wait((diff/65)+1.4)
  Kill(attack.Position)
  end)()
coroutine.wrap(function()
  wait(1)
  Instance.new("Fire",attack).Color=BrickColor.new'Toothpaste'.Color
  while attack.Parent==char and wait(0) do
    cf=CFrame.new(position)
attack.CFrame=CFrame.new(attack.CFrame.p,(cf*CFrame.new(i/5,0,0)).p)*CFrame.new(i<0 and math.random(0,5)/10 or math.random(-5,0)/10,0,-(2+i/50))
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
