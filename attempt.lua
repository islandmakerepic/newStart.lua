local orb=function(char,n)
local ORB=Instance.new("Part",char)
ORB.Name=n
ORB.Shape='Ball'
ORB.Size=Vector3.new(1,1,1)
ORB.Anchored=true
ORB.CFrame=char.Torso.CFrame*CFrame.new(2+n-math.random(-1,3),-1,-(5+n))
ORB.Transparency=0.5
ORB.BrickColor=BrickColor.Random()
return ORB
end

for i=1,20,2 do
orb(owner.Character,i/2)
end
