class BookStore

  PRICE_PER_BOOK = 8.0

  DISCOUNT = {
    2 => 0.05,
    3 => 0.1,
    4 => 0.2,
    5 => 0.25
  }

  CACHE = {}

  def self.calculate_price(basket)

    if CACHE.include?(basket.to_s)
      return CACHE[basket.to_s]
    end

    size = basket.size

    uniq_book = basket.uniq.size

    discount = DISCOUNT.fetch(uniq_book, 0)
    if size == uniq_book
      total = uniq_book * (PRICE_PER_BOOK - (PRICE_PER_BOOK * discount))
      CACHE[basket.to_s] = total
      return total
    end

    groups = []

    basket.each do |book|

      if groups.reject { |g| g.include?(book) }.empty?
        groups << [book]
        next
      end

      total_groups = self.total_groups(groups)
      first_total = self.calculate_price(groups.last)

      total = total_groups - first_total

      min_price = total + self.calculate_price(groups.last + [book])
      min_group = groups.last

      p("check min group #{min_group}, price: #{min_price} for the book #{book}")

      groups[..-1].each_with_index do |group, index|

        p("check group #{group} for the book #{book}")

        group_total = self.calculate_price(group)

        total = total_groups - group_total

        price = self.calculate_price(group + [book])

        p("subtotal #{total + price}")
        if total + price < min_price
          min_price = price + total
          min_group = group
        end
      end

      min_group << book
    end

    total = self.total_groups(groups)

    p("#{groups} = total #{total}")

    total
  end

  def self.total_groups(groups)
    groups.map { |e| self.calculate_price(e) }.sum
  end

end
