package interest

// InterestRate returns the interest rate for the provided balance.
func InterestRate(balance float64) float32 {
	if balance < 0 {
		return 3.213
	}

	if balance >= 5000 {
		return 2.475
	}

	if balance < 1000 {
		return 0.5
	}

	return 1.621
}

// Interest calculates the interest for the provided balance.
func Interest(balance float64) float64 {
	return float64(InterestRate(balance)) / 100 * balance
}

// AnnualBalanceUpdate calculates the annual balance update, taking into account the interest rate.
func AnnualBalanceUpdate(balance float64) float64 {
	return balance + Interest(balance)
}

// YearsBeforeDesiredBalance calculates the minimum number of years required to reach the desired balance.
func YearsBeforeDesiredBalance(balance, targetBalance float64) int {

	if balance >= targetBalance {
		return 0
	}

	anual := AnnualBalanceUpdate(balance)
	count := 1
	for {
		if anual >= targetBalance {
			return count
		}
		count++
		anual = AnnualBalanceUpdate(anual)
	}
	return count
}
