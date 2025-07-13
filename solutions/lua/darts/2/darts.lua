local Darts = {}

function Darts.score(x, y)
	local position = math.sqrt(x ^ 2 + y ^ 2)

	if position <= 1 then
		return 10
	end

	if position <= 5 then
		return 5
	end

	if position <= 10 then
		return 1
	end

	return 0
end

return Darts
