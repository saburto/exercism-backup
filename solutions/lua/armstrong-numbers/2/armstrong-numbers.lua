local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
	local digits = tostring(number)
	local total = 0
	for i = 1, #digits do
		total = total + (tonumber(digits:sub(i, i)) ^ #digits)
	end

	return total == number
end

return ArmstrongNumbers
