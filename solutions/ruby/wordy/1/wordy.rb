class WordProblem
  attr_reader :question
  def initialize(question)
    @question = question
  end

  def answer
    data = question.match(
      /What is (?<a>-?\d*) (?<c>plus|minus|multiplied|divided)( by)? (?<b>-?\d*) ?(?<second_command>plus|minus|multiplied|divided)?( by)? ?(?<d>-?\d*)?\?/
    )

    unless data
      raise ArgumentError
    end

    command = data[:c]

    answer = execute_command(command, data[:a].to_i, data[:b].to_i)

    if data[:second_command]
      second_command = data[:second_command]
      answer = execute_command(second_command, answer, data[:d].to_i)
    end

    answer
  end

  def execute_command(command, a, b)
    case command
    when "plus"
      a + b
    when "minus"
      a - b
    when "multiplied"
      a * b
    when "divided"
      a / b
    end
  end

end
