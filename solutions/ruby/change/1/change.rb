class Change

  class ImpossibleCombinationError < StandardError
  end

  class NegativeTargetError < StandardError
  end

  MAX = 10 ** 24

  def self.generate(coins, amount)
    result = self.do_generate(coins, amount)
    raise ImpossibleCombinationError if result.nil?
    result
  end

  def self.do_generate(coins, amount)
    raise NegativeTargetError if amount < 0
    return ImpossibleCombinationError if coins.empty?

    return [] if amount.zero?
    coins.sort!

    result = []
    min = MAX

    coins.each_with_index do |coin, index|

      quantity = amount / coin
      next if quantity <= 0

      rest = amount % coin

      if rest > 0 && rest < coins[0]
        temp_result = [coin]
        rest_result = self.do_generate(coins, amount - coin)
      else
        temp_result = [coin] * quantity
        rest_result = self.do_generate(coins[..(index - 1)], rest)
      end

      next if rest_result.nil?

      total = quantity + rest_result.size
      total_result = temp_result + rest_result
      if min > total && total_result.sum == amount
        min = total
        result = total_result
      end
    end

    return nil if min == MAX

    result.sort
  end

  # 1   5   10  21 25 = Value 63
  # 63  12  6   3  2.52
  #     6   3
  #
  # 1   4     15    20    50    Value 23
  # 23  5     1     1     x
  #     1*3   4*2   1*3
end
