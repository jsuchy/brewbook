class Brew
  def self.required_fields
    @required_fields || []
  end

  def self.required_field(*fields)
    fields.each do |field|
      attr_reader field
      @required_fields ||= []
      @required_fields << field
    end
  end
  required_field :name, :brew_date

  def initialize(attributes)
    @name = attributes["name"]
    @brew_date = attributes["brew_date"]
  end

  def valid?
    self.class.required_fields.none? do |field|
      self.send(field).nil?
    end
  end
end
