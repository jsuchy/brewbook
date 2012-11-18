require 'new_hop_form'
require 'new_grain_form'
require 'brewery/use_cases/create_a_brew'

module Forms
  class NewBrew
    # ActiveModel plumbing to make `form_for` work
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations

    def persisted?
      false
    end

    ATTRIBUTES = [:name, :mash_temp, :mash_time, :yeast, :yeast_amount, :fermentation_duration, :fermentation_temperature, :pre_boil_gravity, :original_gravity, :final_gravity, :grains_attributes, :hops_attributes]

    attr_accessor *ATTRIBUTES

    def initialize(attributes = {})
      ATTRIBUTES.each do |attribute|
        send("#{attribute}=", attributes[attribute])
      end
    end

    validates :mash_temp, :mash_time, :fermentation_duration, :fermentation_temperature, :pre_boil_gravity, :original_gravity, :final_gravity, :numericality => true, :allow_blank => true

    validates :name, :mash_temp, :mash_time, :yeast, :yeast_amount, :fermentation_duration, :fermentation_temperature, :presence => true

    validate do
      [hops, grains].each do |objects|
        objects.each do |object|
          object.valid?
        end
      end
    end

    def hops
      @hops ||= [Forms::NewHop.new]
    end

    def hops_attributes=(attrs)
      return unless attrs
      @hops = attrs.values.map { |hash| Forms::NewHop.new(hash) }
    end

    def grains
      @grains ||= [Forms::NewWeightedGrain.new]
    end

    def grains_attributes=(attrs)
      return unless attrs
      @grains = attrs.values.map { |hash| Forms::NewWeightedGrain.new(hash) }
    end

    def save
      return false unless valid?

      results = Brewery::UseCase::CreateABrew.new(to_brewery).execute
      results[:valid]
    end

    def to_brewery
      [:name, :mash_temp, :mash_time, :yeast, :yeast_amount, :fermentation_duration,
       :fermentation_temperature, :pre_boil_gravity, :original_gravity, :final_gravity]
      .reduce({}) { |acc, attr| acc[attr] = self.send(attr); acc }
      .merge({
        :grains => grains.map(&:to_brewery), 
        :hops => hops.map(&:to_brewery)
      })
    end
  end
end
