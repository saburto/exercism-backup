class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)

    unless ALLOWED_OPERATIONS.include? operation
      raise UnsupportedOperation
    end

    unless first_operand.is_a? Numeric
      raise ArgumentError
    end

    unless second_operand.is_a? Numeric
      raise ArgumentError
    end

    if second_operand.zero?
      return 'Division by zero is not allowed.'
    end

    result = first_operand.send(operation, second_operand)

    "#{first_operand} #{operation} #{second_operand} = #{result}"

  end

  class UnsupportedOperation < StandardError
  end
end
