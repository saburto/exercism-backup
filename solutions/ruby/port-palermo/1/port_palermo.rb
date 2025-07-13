module Port
  IDENTIFIER = :PALE

  PORTS = {
    'Hamburg' => :HAMB,
    'Rome' => :ROME,
    'Kiel' => :KIEL
  }

  TERMINALS = {
    OIL123: :A,
    GAS674: :A,
    CAR942: :B,
    CLO315: :B
  }

  def self.get_identifier(city)
    PORTS[city]
  end

  def self.get_terminal(ship_identifier)
    TERMINALS[ship_identifier]
  end
end
