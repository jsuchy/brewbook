module Brewery
  Brew = Struct.new(:id, :name, :mash_temp, :mash_time, 
                    :yeast, :yeast_amount, :fermentation_temperature,
                    :fermentation_duration, :original_gravity,
                    :pre_boil_gravity, :final_gravity, :created_at)

  def Brew.from_params(params)
    new(
      params[:id],
      params[:name],
      params[:mash_temp],
      params[:mash_time],
      params[:yeast],
      params[:yeast_amount],
      params[:fermentation_temperature],
      params[:fermentation_duration],
      params[:original_gravity],
      params[:pre_boil_gravity],
      params[:final_gravity],
      params[:created_at]
    )
  end
end
