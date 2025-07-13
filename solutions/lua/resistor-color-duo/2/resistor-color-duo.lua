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
return {
	value = function(colors)
		local first = colors[1]
		local second = colors[2]

		return tableColors[first] * 10 + tableColors[second]
	end,
}
