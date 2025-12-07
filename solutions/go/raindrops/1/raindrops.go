package raindrops

import "strconv"

func Convert(number int) string {

	inText := ""
	if number%3 == 0 {
		inText += "Pling"
	}

	if number%5 == 0 {
		inText += "Plang"
	}

	if number%7 == 0 {
		inText += "Plong"
	}

	if inText != "" {
		return inText
	}
	return strconv.Itoa(number)
}
