// Package weather
// introduce
// another
// another line.
package weather

var (
	// CurrentCondition of the weather.
	CurrentCondition string
	// CurrentLocation of the weather.
	CurrentLocation string
)

// Forecast function.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
