=begin
Write your code for the 'Space Age' exercise in this file. Make the tests in
`space_age_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/space-age` directory.
=end
class SpaceAge

  EARTH_YEAR_IN_SECONDS = 31557600.0
  PLANETS = {
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze
  
  def initialize(current_age)
    PLANETS.each do|planet, diff |
      self.class.define_method("on_#{planet}") do
        current_age / (EARTH_YEAR_IN_SECONDS * diff)
      end
    end
  end
end