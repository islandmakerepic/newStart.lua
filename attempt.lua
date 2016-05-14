local orb=function(char,n)
local ORB=Instance.new("Part",char)
ORB.Name=n
ORB.Shape='Ball'
ORB.Size=Vector3.new(1,1,1)
ORB.Anchored=true
ORB.CFrame=char.Torso.CFrame*CFrame.new(2+(math.random(0,1)==1 and n or -n),-1,-5)
ORB.Transparency=0.5
ORB.BrickColor=BrickColor.Random()
return ORB
end

for i=1,50,3 do
orb(owner.Character,i/2)
end
