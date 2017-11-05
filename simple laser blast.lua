--all credit goes to TheEditNinja/islandmaker2012-[GOLD] Edit Ninja on youtube
--dont steal my stuff

local plr=game.Players.LocalPlayer

local char=plr.Character
local tool=Instance.new("Tool",plr.Backpack)
local handle=Instance.new("Part",tool)
handle.Name='Handle'
handle.Size=Vector3.new(1.3,1.3,2.3)
handle.TopSurface="Smooth" handle.BackSurface="Smooth" 
handle.LeftSurface="Smooth" handle.BottomSurface="Smooth" 
handle.FrontSurface="Smooth" handle.RightSurface="Smooth" 
tool.GripPos=Vector3.new(0,0,1)
tool.Unequipped:connect(function()
	plr.CameraMaxZoomDistance=400
end)
tool.Equipped:connect(function(mouse)
	ypcall(function()
		tool.delethis:Destroy()
	end)
	plr.CameraMaxZoomDistance=0.5
handle.BrickColor=BrickColor.Random()
m=mouse
local firing

local cut=function(obj)
local cl=obj:clone()
local x,y,z=cl.Size.X,cl.Size.Y,cl.Size.Z
cl.Size=Vector3.new(x/2,y/2,z/2)
cl.Anchored=true
cl.CanCollide=true
cl.Parent=obj.Parent
cl.CFrame=obj.CFrame*CFrame.new(x/2-(cl.Size.X/2)-(x/20),y/2-(cl.Size.Y/2),0)
local cl2=cl:clone()
cl2.Parent=obj.Parent
cl2.CFrame=cl.CFrame*CFrame.new(-cl.Size.X,0,0)
local cc=cl:clone()
cc.Parent=obj.Parent
cc.CFrame=cl.CFrame*CFrame.new(-(cl.Size.X)-(x/20),cl.Size.Y+(y/20),0)
local cc2=cl:clone()
cc2.Parent=obj.Parent
cc2.CFrame=cl.CFrame*CFrame.new(0,cl.Size.Y+(y/20),0)
obj:BreakJoints()
obj:Remove()
cl.Anchored,cl2.Anchored,cc.Anchored,cc2.Anchored=false,false,false,false
end

m.Button1Down:connect(function()
	if not firing then firing = true
		local blast=m.Hit.p
		local Raylen=(blast-handle.CFrame.p).magnitude
		local block=Instance.new("Part",tool)
		block.Size=Vector3.new(7,6,0.3)
		block.CanCollide=false
		block.Anchored=true
		block.Transparency=0.9
		block.Name='delethis'
		block.CFrame=handle.CFrame*CFrame.new(0,0,-1.3)
		local newp=handle:clone()
		newp.Name='nothandle'
		newp.Parent=handle
		newp.Size=Vector3.new(handle.Size.X,handle.Size.Y,0.2)
		newp.Anchored=true
		newp.BrickColor=BrickColor.new("Toothpaste")
		newp.Transparency=0.8
		for i=0,36,2 do
			block.Transparency=block.Transparency-(i/36)
			block.CFrame=handle.CFrame*CFrame.new(0,0,-1.3)*CFrame.Angles(0,0,math.rad(i*10))
			block.Size=block.Size-Vector3.new(7/18,6/18,0.00001)
			newp.Size=Vector3.new(handle.Size.X+0.1,handle.Size.Y+0.1,((1.15/18)*i))+Vector3.new(0,0,0.1)
			newp.CFrame=handle.CFrame*CFrame.new(0,0,1.15-((0.575/18)*i))
			wait(0.03)
		end
		game.Debris:AddItem(newp,0.01)
		wait(0.3)
		for i=0,45,4 do
			block.Size=block.Size+Vector3.new(14/9,12/9,0.00002)
			block.CFrame=handle.CFrame*CFrame.new(0,0,-1.3)*CFrame.Angles(0,0,math.rad(360-(i*10)))
			
			block.BrickColor=BrickColor.Random()
			wait(0)
		end
		game.Debris:AddItem(block,0.1)
		local ray= Instance.new("Part",workspace)
		ray.Size=Vector3.new(1,1,Raylen)
		ray.CFrame=CFrame.new(handle.CFrame.p,m.Hit.p)*CFrame.new(0,0,-(Raylen/2))
		ray.Anchored=true
		ray.CanCollide=false
		ray.BrickColor=BrickColor.Red()
		ray.TopSurface="Smooth"
		ray.Material='Neon'
		ray.Transparency=0.5
		local dodmg=ray:clone()
		dodmg.Transparency=1
		dodmg.Parent=ray
		dodmg.CFrame=ray.CFrame+Vector3.new(0,1,0)
		local broken=false
		dodmg.Touched:connect(function(h)
			if broken then return end
			if h.Parent~=char and not h.Name:match"Base" and h.Parent~=tool and h.Parent~=ray and h~=ray then
				cut(h)
				broken=true
				Instance.new("Explosion",workspace).Position=h.Position
			end
		end)
		dodmg.Anchored=false
		game.Debris:AddItem(ray,1)
		wait(1)
		firing=false
	end
	return
end)
end)
