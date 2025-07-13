local tableColors = {
	black = 0,
	brown = 1,
	red = 2,
	orange = 3,
	yellow = 4,
	green = 5,
	blue = 6,
	violet = 7,
	grey = 8,
	white = 9,
}

local unitAndDivisor = function(zeros)
	local unit = "ohms"
	local divisor = 1
	if zeros > 1 and zeros < 6 then
		unit = "kiloohms"
		divisor = 1000
	end

	if zeros >= 6 and zeros < 9 then
		unit = "megaohms"
		divisor = 1000000
	end

	if zeros >= 9 then
		unit = "gigaohms"
		divisor = 1000000000
	end
	return unit, divisor
end

local multiplierByZeros = function(zeros)
	return 10 ^ zeros
end

return {
	decode = function(c1, c2, c3)
		local value = tableColors[c1] * 10 + tableColors[c2]
		local zeros = tableColors[c3]
		local unit, divisor = unitAndDivisor(zeros)
		value = value * multiplierByZeros(zeros)

		return value / divisor, unit
	end,
}
