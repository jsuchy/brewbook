module Records
  class WeightedGrain
    include DataMapper::Resource

    property :id, Serial
    property :name, String
    property :pounds, Float, :default => 0
    property :ounces, Float, :default => 0

    belongs_to :brew, 'Records::Brew', :key => true

    def weight
      pounds + (ounces / 16)
    end
  end
end
