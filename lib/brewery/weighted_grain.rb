module Brewery
  class WeightedGrain

    def self.from_params(params)
      self.new(params[:weight], params[:recipe_id], params[:grain_id])
    end

    attr_reader :weight, :grain_id, :recipe_id
    attr_accessor :id

    def initialize(weight, recipe_id, grain_id)
      @weight = weight
      @recipe_id = recipe_id.to_i
      @grain_id = grain_id.to_i
    end

  end
end
