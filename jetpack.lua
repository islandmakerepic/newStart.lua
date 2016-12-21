i = game.Players.LocalPlayer
bp = i.Backpack
c = i.Character
targ =nil
t = Instance.new("Tool",bp)
h = Instance.new("Part",t)
h.Size = Vector3.new(1,1,1)
Instance.new("CylinderMesh",h)
h.BrickColor = BrickColor.new("Really red")
h.Name = "Handle"
h.Mesh.Scale = Vector3.new(1,0.5,1)
t.Unequipped:connect(function()
gm = nil
ypcall(function()
p:Destroy()
end)
end)
t.Equipped:connect(function(mouse)
	gm = mouse
wait()
if t:findFirstChild("Part") then
t.Part:Destroy()
end
p = Instance.new("Part")
p.Size = Vector3.new(2,3,1)
w = Instance.new("Weld",c.Torso)
w.Part0 = c.Torso
w.Part1 = p
p.Parent = t
Instance.new("CylinderMesh",p)
w.C0 = CFrame.new(0,0,1)
mouse.Button1Down:connect(function()
	bv = Instance.new("BodyVelocity",c.Torso)
	bv.Name = "bv"
	bv.velocity = Vector3.new(0,50,0)
cli = true
end)
mouse.Button1Up:connect(function()
cli = false
end)
mouse.KeyDown:connect(function(k)
if k == "b" then
local b = Instance.new("Part",Workspace)
b.Size = Vector3.new(2,2,2)
b.CFrame = c.Torso.CFrame*CFrame.new(0,0,-3)
b.Shape = "Ball"
b.Name = "Bomb"
game.Debris:AddItem(b,2.3)
wait(2)
Instance.new("Explosion",Workspace).Position = b.Position
elseif k == "f" then
	firing = true
dist = mouse.Hit.p-c.Torso.Position
mag = dist.magnitude
lazer = Instance.new("Part",c)
lazer.FormFactor = "Custom"
lazer.Name = "Lazer"
lazer.Size = Vector3.new(0.1,0.1,15)
pos = 15/2
lazer.CFrame = CFrame.new(c.Torso.Position,mouse.Hit.p)
lazer.CFrame = lazer.CFrame*CFrame.new(0,0,mag>0 and lazer.Size.Z/2 or -lazer.Size.Z/2)
lazer.CanCollide = false
					lazer.Anchored=true
					lazer.BrickColor=BrickColor.Random()
 lazer.Touched:connect(function(v)
targ = (v.Parent:findFirstChild("Humanoid")~=nil and v.Parent or nil)
if targ==c then
targ =nil
end
if targ~=nil then
tofire = v
end
end)

end
end)
mouse.KeyUp:connect(function(k)
if k=="f" then
firing = false
ypcall(function()
lazer:Destroy()
end)
end
end)
end)


while wait() do

if cli then
	local pp = Instance.new("Part",Workspace)
	pp.Size = Vector3.new(1,1,1)
	pp.CFrame = p.CFrame*CFrame.new(math.random(-1,1)/5,math.random(-1,0),math.random(-1,1)/5)
pp.CanCollide = false
pp.Shape = "Ball"
Instance.new("Smoke",pp)
pp.Velocity = Vector3.new(0,-50,0)
pp.Anchored = false
c.Torso.Velocity = Vector3.new(0,50,0)
bv.velocity = Vector3.new(0,50,0)
game.Debris:AddItem(pp,2)
h.BrickColor = BrickColor.new("Lime green")
func = coroutine.wrap(function()
wait(1)
Instance.new("Fire",pp) 
end)
func()
else
ypcall(function()
h.BrickColor = BrickColor.new("Really red")
bv:Destroy()
end)
end
if gm~=nil then
	
 if lazer~=nil and firing then
	
  if targ~=nil then
f = coroutine.wrap(function()
wait()
ypcall(function()
local f = Instance.new("Fire",tofire)
game.Debris:AddItem(f,1)
targ.Humanoid.Health = targ.Humanoid.Health-5
end)
end)
f()
  end

funcc = coroutine.wrap(function()
wait(0)
lazer.CFrame = CFrame.new(c.Torso.Position,gm.Hit.p)
lazer.CFrame = lazer.CFrame*CFrame.new(0,0,mag <0 and pos or -pos)
local a = Instance.new("Part",Workspace)
a.Transparency = 1
a.Size = Vector3.new(1,1,1)
a.Anchored = true
a.CanCollide = false
a.CFrame = lazer.CFrame*CFrame.new(0,0,mag>0 and -lazer.Size.Z/2 or lazer.Size.Z/2)
Instance.new("Fire",a)
game.Debris:AddItem(a,0)
end)
funcc()
 end
end

end
