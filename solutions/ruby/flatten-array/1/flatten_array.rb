=begin
Write your code for the 'Flatten Array' exercise in this file. Make the tests in
`flatten_array_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/flatten-array` directory.
=end
class FlattenArray
  def self.flatten(array)
    array.reduce([]) do |acc, a|
      return acc if a.nil?

      elements = a.kind_of?(Array) ? self.flatten(a) : a
      
      acc.push(*elements)
    end
  end
end