package lasagna

// TODO: define the 'PreparationTime()' function

func PreparationTime(layers []string, time int) int {
	if time == 0 {
		return len(layers) * 2
	}
	return len(layers) * time
}

// TODO: define the 'Quantities()' function
func Quantities(ingredients []string) (noodles int, sauce float64) {
	sauceCount := 0
	noodlesCount := 0
	for _, v := range ingredients {
		if v == "sauce" {
			sauceCount++
		}

		if v == "noodles" {
			noodlesCount++
		}

	}
	return noodlesCount * 50, float64(sauceCount) * 0.2
}

// TODO: define the 'AddSecretIngredient()' function
func AddSecretIngredient(friendList []string, mylist []string) {
	mylist[len(mylist)-1] = friendList[len(friendList)-1]
}

// TODO: define the 'ScaleRecipe()' function
func ScaleRecipe(quantities []float64, scale int) []float64 {

	output := make([]float64, len(quantities))
	for i := range quantities {

		onePortion := quantities[i] / 2
		output[i] = onePortion * float64(scale)
	}

	return output
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
