local gigasecond = {}

function gigasecond.anniversary(any_date)
	local future = any_date + (10 ^ 9)
	return os.date("%x", future)
end

return gigasecond
