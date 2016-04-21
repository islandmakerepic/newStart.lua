local down={}
local combos = 
{right = {'l','i','u','h'},
left = {'f','t','y','j'}
}
local combo=''
local downN=function(k)
down[k]=true
combo=combo..k
local CC=table.concat
local comb1=CC(combos['left'],'')
local comb2=CC(combos['right'],'')
--print(combo)
if combo:match(comb1) then
	print'combo 1'
	combo=''
	
elseif combo:match(comb2) then
	print'combo2'
	combo=''
end
end

plr=game.Players.LocalPlayer
m=plr:GetMouse()
m.KeyUp:connect(function(k)
	print(k)
downN(k)
end)

