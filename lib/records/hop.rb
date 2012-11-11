require 'dm-core'

module Records
  class Hop
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :weight, Float, :default => 0
    property :boil_duration, Integer

    belongs_to :recipe, 'Records::Recipe', :key => true
  end
end
