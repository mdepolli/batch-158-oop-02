class Patient
  attr_accessor :id, :name, :cured, :blood_type, :room

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @blood_type = attributes[:blood_type] || "A"
    @room = attributes[:room]
  end

  # BEHAVIOR

  def cure
    @cured = true
  end
end

# marcelo = Patient.new(name: "Marcelo")

# fernando = Patient.new(name: "fernando", cured: true, blood_type: "AB")
