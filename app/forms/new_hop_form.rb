require 'brewery/hop'

module Forms
  class NewHop
    # ActiveModel plumbing to make `form_for` work
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations

    def persisted?
      false
    end

    ATTRIBUTES = [:name, :weight, :boil_duration]

    attr_accessor *ATTRIBUTES

    def initialize(attributes = {})
      ATTRIBUTES.each do |attribute|
        send("#{attribute}=", attributes[attribute])
      end
    end

    validates :weight, :boil_duration, :numericality => true, :allow_blank => true

    validates :name, :weight, :boil_duration, :presence => true

    def to_brewery
      Brewery::Hop.new(name, weight, boil_duration)
    end
  end
end

