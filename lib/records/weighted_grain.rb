require 'dm-core'

module Records
  class WeightedGrain
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :weight, Float, :default => 0

    belongs_to :recipe, 'Records::Recipe', :key => true
  end
end
