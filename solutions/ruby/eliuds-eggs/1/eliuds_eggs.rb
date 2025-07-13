class EliudsEggs
  def self.egg_count(number)
    number.to_s(2).chars.filter { |b| b == "1" }.size
  end
end
