package parsinglogfiles

import (
	"fmt"
	"regexp"
)

func IsValidLine(text string) bool {
	re := regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)+\] .*`)
	return re.MatchString(text)
}

func SplitLogLine(text string) []string {
	re := regexp.MustCompile(`<[-~*=]*>`)
	return re.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	count := 0
	re := regexp.MustCompile(`(?i)".*password.*"`)
	for _, line := range lines {
		if re.MatchString(line) {
			count++
		}
	}
	return count

}

func RemoveEndOfLineText(text string) string {
	re := regexp.MustCompile(`end-of-line[0-9]*`)
	return re.ReplaceAllString(text, "")

}

func TagWithUserName(lines []string) []string {

	output := []string{}

	re := regexp.MustCompile(`User[ ]+(\w+)`)
	for _, line := range lines {

		matches := re.FindStringSubmatch(line)
		if re.NumSubexp() == 1 && len(matches) > 1 {
			newline := fmt.Sprintf("[USR] %s %s", matches[1], line)
			output = append(output, newline)
		} else {
			output = append(output, line)
		}
	}
	return output
}
