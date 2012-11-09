require 'dm-core'

module Record
  class Hop
    include DataMapper::Resource

    property :name, String
    property :weight, Float, :default => 0
    property :boil_duration, Integer
  end
end
