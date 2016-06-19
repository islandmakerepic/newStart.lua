garble=function(text)
local ct=''
for i=1,#text do
if math.random(1,3)==1 then
ct=ct..text:sub(i,i):upper()
else ct=ct..text:sub(i,i)
end
if math.random(2,10)<5 then
local s=math.random(1,#text)
ct=ct..text:sub(s,s):upper()
end

  end
return ct
end

what=function()
if math.random(3)==1 then
if math.random(10)>5 then
Instance.new("Message",workspace).Text=garble(math.random(1,3)==1 and 'problem' or 'mistake')
else
Instance.new("Hint",workspace).Text=garble(math.random(1,3)==1 and 'error' or 'problem')
end
end
end
workspace.ChildAdded:connect(function(c)
  wait(0)
  if c:IsA'Hint' or c:IsA'Message' then game.Debris:AddItem(c,1) end
  end)
while wait(0.3) do
if math.random(1,3)==3 then
what()
end
end

