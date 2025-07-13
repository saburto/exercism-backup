class Integer

  def to_roman

    thousands = self / 1000

    return transform_to_roman_10(thousands, 1000, "M", "M") if thousands > 0

    return transform_to_roman(500, "D", 900, "CM") if self >= 500

    houndres = self / 100

    return transform_to_roman_10(houndres, 100, "C", "CD") if houndres > 0

    return transform_to_roman(50, "L", 90, "XC") if self >= 50

    decimals = self / 10

    return transform_to_roman_10(decimals, 10, "X", "XL") if decimals > 0

    return transform_to_roman(5, "V", 9, "IX") if self >= 5

    return transform_to_roman_10(self, 1, "I", "IV") if self > 0

    ""
  end

  private

  def transform_to_roman_10(decimals, min_value, min_roman_value, more_than_five_roman_value)
    return min_roman_value * decimals + (self % min_value).to_roman if decimals < 4
    return more_than_five_roman_value + (self % min_value).to_roman
  end

  def transform_to_roman(min_value, min_roman_value, exception_value, exception_roman_value)
    return exception_roman_value + (self - exception_value).to_roman if self >= exception_value
    return min_roman_value + (self - min_value).to_roman
  end

end
