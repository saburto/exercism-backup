=begin
Write your code for the 'Bob' exercise in this file. Make the tests in
`bob_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/bob` directory.
=end

class Bob
  def self.hey(remark)
    if remark.strip.empty?
      return 'Fine. Be that way!'
    end
    if remark == remark.upcase && remark.match?(/[A-Z]+/)
      if remark.match?(/\?/)
        return 'Calm down, I know what I\'m doing!'
      end
      
      return 'Whoa, chill out!'
    end

    if remark.strip.gsub(/\n/, '').match?(/\?$/)
      return "Sure."
    end
    
    
    
    "Whatever."
  end
end
