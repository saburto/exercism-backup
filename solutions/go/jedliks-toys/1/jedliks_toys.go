package jedlik

import "fmt"

// TODO: define the 'Drive()' method
func (car *Car) Drive() {
	if car.battery-car.batteryDrain < 0 {
		return
	}
	car.battery -= car.batteryDrain
	car.distance += car.speed
}

// TODO: define the 'DisplayDistance() string' method
func (car Car) DisplayDistance() string {
	return fmt.Sprintf("Driven %d meters", car.distance)
}

// TODO: define the 'DisplayBattery() string' method
func (car Car) DisplayBattery() string {
	return fmt.Sprintf("Battery at %d%%", car.battery)
}

// TODO: define the 'CanFinish(trackDistance int) bool' method
func (car Car) CanFinish(trackDistance int) bool {
	// track 10 km
	// speed 5 km -> how many drive? 10 / 5 = 2
	// battery drain 2 km -> how many drains? 2 * 2
	howManyDrive := float64(trackDistance) / float64(car.speed)
	batterDrainNeeded := howManyDrive * float64(car.batteryDrain)
	return car.battery >= int(batterDrainNeeded)
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
