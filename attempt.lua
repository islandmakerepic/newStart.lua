local orb=function(char,n)
local ORB=Instance.new("Part",char)
ORB.Name=n
ORB.Shape='Ball'
ORB.Size=Vector3.new(1,1,1)
ORB.Anchored=true
ORB.CFrame=char.Torso.CFrame*CFrame.new(3+n-math.random(-2,4),-1,-n)
ORB.Transparency=0.5
ORB.BrickColor=BrickColor.Random()
return ORB
end

for i=4,14,2 do
orb(owner.Character,i)
wait(0)
end
for i=14,4,-2 do
  wait(0)
orb(owner.Character,i)
end
