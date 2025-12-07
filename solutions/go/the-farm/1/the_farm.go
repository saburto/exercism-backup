package thefarm

import (
	"errors"
	"fmt"
)

// TODO: define the 'DivideFood' function
func DivideFood(calcualtr FodderCalculator, cows int) (float64, error) {

	amount, error := calcualtr.FodderAmount(cows)

	if error != nil {
		return 0, error
	}

	factor, error := calcualtr.FatteningFactor()
	if error != nil {
		return 0, error
	}

	return (amount * factor) / float64(cows), nil

}

// TODO: define the 'ValidateInputAndDivideFood' function

func ValidateInputAndDivideFood(calc FodderCalculator, cows int) (float64, error) {
	if cows <= 0 {
		return 0, errors.New("invalid number of cows")
	}
	return DivideFood(calc, cows)
}

type InvalidCowsError struct {
	count int
}

func (e InvalidCowsError) Error() string {
	if e.count == 0 {
		return "0 cows are invalid: no cows don't need food"
	}
	return fmt.Sprintf("%d cows are invalid: there are no negative cows", e.count)
}

// TODO: define the 'ValidateNumberOfCows' function
func ValidateNumberOfCows(cows int) error {
	if cows <= 0 {
		return &InvalidCowsError{
			count: cows,
		}
	}
	return nil
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
