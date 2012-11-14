require 'dm-core'

class WeightedGrain
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :weight, Float, :default => 0

  belongs_to :brew, 'Brew', :key => true
end
