package chance

import "math/rand"

// RollADie returns a random int d with 1 <= d <= 20.
func RollADie() int {
	return 1 + int(rand.Int31n(20))
}

// GenerateWandEnergy returns a random float64 f with 0.0 <= f < 12.0.
func GenerateWandEnergy() float64 {
	return rand.Float64() * 12
}

func SwapAnimals(animals []string) func(i, j int) {
	return func(i int, j int) {

		tmp := animals[i]
		animals[i] = animals[j]
		animals[j] = tmp
	}
}

// ShuffleAnimals returns a slice with all eight animal strings in random order.
func ShuffleAnimals() []string {
	animals := []string{"ant", "beaver", "cat", "dog", "elephant", "fox", "giraffe", "hedgehog"}

	rand.Shuffle(len(animals), SwapAnimals(animals))

	return animals
}
