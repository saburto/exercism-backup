class BookStore

  PRICE_PER_BOOK = 8.0

  DISCOUNT = {
    2 => 0.05,
    3 => 0.1,
    4 => 0.2,
    5 => 0.25
  }

  def self.calculate_price_order(basket, sort_order, max_group = 5)
    groups = []

    basket.each do |book|

      sorted = groups.sort { |a, b| a.size - b.size }
      if sort_order == -1
        sorted = groups.sort { |a, b| b.size - a.size }
      end

      group = sorted.reject { |e| e.include?(book) }.reject { |e| e.size == max_group }.first
      unless group
        groups << [book]
        next
      end

      group << book
    end

    puts("Groups: #{groups}")

    groups
      .map do |e|
        discount = DISCOUNT.fetch(e.length, 0)

        e.length * (PRICE_PER_BOOK - (PRICE_PER_BOOK * discount))
      end
      .sum
  end

  def self.calculate_price(basket)
    basket = basket.group_by { |a| a }.values.sort { |a, b| b.size - a.size }.flatten

    unique_size = basket.uniq.size
    min_total = basket.size * PRICE_PER_BOOK
    while (unique_size > 0)
      min_total = [
        min_total,
        calculate_price_order(basket, 1, unique_size),
        calculate_price_order(basket, -1, unique_size)
      ].min
      unique_size -= 1
    end

    min_total
  end

end
