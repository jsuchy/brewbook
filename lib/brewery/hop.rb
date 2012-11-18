module Brewery
  Hop = Struct.new(:name, :weight, :boil_duration)

  def Hop.from_params(params)
    new(
      params[:name], 
      params[:weight], 
      params[:boil_duration]
    )
  end
end
