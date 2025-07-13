module Blackjack
  def self.parse_card(card)
    case card
    when "ace"
      11
    when "two"
      2
    when "three"
      3
    when "four"
      4
    when "five"
      5
    when "six"
      6
    when "seven"
      7
    when "eight"
      8
    when "nine"
      9
    when "ten"
      10
    when "jack", "queen", "king"
      10
    else
      0
    end
  end

  def self.card_range(card1, card2)
    card1_value = parse_card(card1)
    card2_value = parse_card(card2)

    case card1_value + card2_value
    when (4..11)
      "low"
    when (12..16)
      "mid"
    when (17..20)
      "high"
    else
      "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    dealer_card_value = parse_card(dealer_card)
    card_range = card_range(card1, card2)

    case
    when (card1 == 'ace' && card1 == card2)
      "P"
    when (card_range == 'blackjack' && dealer_card_value < 10)
      "W"
    when (card_range == 'blackjack' && dealer_card_value >= 10) || (card_range == 'high') || (card_range == 'mid' && dealer_card_value < 7)
      "S"
    when (card_range == 'mid' && dealer_card_value >= 7) || (card_range == 'low')
      "H"
    else
      raise "Error no expected"
    end
  end
end
