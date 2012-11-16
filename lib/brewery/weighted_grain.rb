module Brewery
  WeightedGrain = Struct.new(:name, :pounds, :ounces) do
    def weight
      pounds.to_f + (ounces.to_f / 16)
    end
  end

  def WeightedGrain.from_params(params)
    new(
      params[:name],
      Float(params[:pounds]),
      Float(params[:ounces])
    )
  end
end
