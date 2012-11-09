require 'dm-core'

module Record
  class WeightedGrain
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :weight, Float, :default => 0
  end
end
