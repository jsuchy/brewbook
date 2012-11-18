require 'brewery/weighted_grain'

module Forms
  class NewWeightedGrain
    # ActiveModel plumbing to make `form_for` work
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations

    def persisted?
      false
    end

    ATTRIBUTES = [:name, :pounds, :ounces]

    attr_accessor *ATTRIBUTES

    def initialize(attributes = {})
      ATTRIBUTES.each do |attribute|
        send("#{attribute}=", attributes[attribute])
      end
    end

    validates :pounds, :ounces, :numericality => true, :allow_blank => true

    validates :name, :pounds, :ounces, :presence => true

    def to_brewery
      Brewery::WeightedGrain.new(name, pounds, ounces)
    end
  end
end


