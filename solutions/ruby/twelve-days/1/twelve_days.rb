class TwelveDays

  DAYS = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth]
  GIFTS = [
    "twelve Drummers Drumming",
    "eleven Pipers Piping",
    "ten Lords-a-Leaping",
    "nine Ladies Dancing",
    "eight Maids-a-Milking",
    "seven Swans-a-Swimming",
    "six Geese-a-Laying",
    "five Gold Rings",
    "four Calling Birds",
    "three French Hens",
    "two Turtle Doves",
    "a Partridge in a Pear Tree"
  ]

  def initialize
  end

  def song
    gifts = []

    out = DAYS.map do |d|

      if gifts.size == 1
        gifts[0] = "and #{gifts.first}"
      end

      gifts.insert(0, GIFTS.pop)
      pharse(d, gifts)
    end

    out.join("\n")
  end

  def pharse(day, gift)
    "On the #{day} day of Christmas my true love gave to me: #{gift.join(", ")}.\n"
  end

  def self.song
    TwelveDays.new.song
  end

end
