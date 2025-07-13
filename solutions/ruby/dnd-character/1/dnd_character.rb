class DndCharacter

  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma

  def self.modifier(constitution)
    ((constitution - 10) / 2).ceil
  end

  def initialize
    @strength = sum_three_max
    @dexterity = sum_three_max
    @constitution = sum_three_max
    @intelligence = sum_three_max
    @wisdom = sum_three_max
    @charisma = sum_three_max
  end

  def hitpoints
    DndCharacter.modifier(@constitution) + 10
  end

  def sum_three_max
    dices = (1..4).map { |_| dice }
    dices.sum - dices.min
  end

  def dice
    Random.rand(6) + 1
  end
end
