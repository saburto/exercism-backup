local Darts = {}

function Darts.score(x, y)
	local position = math.abs(x ^ 2) + math.abs(y ^ 2)

	if position <= 1 ^ 2 then
		return 10
	end

	if position <= 5 ^ 2 then
		return 5
	end

	if position <= 10 ^ 2 then
		return 1
	end

	return 0
end

return Darts
