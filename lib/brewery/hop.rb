module Brewery
  Hop = Struct.new(:name, :weight, :boil_duration)

  def Hop.from_params(params)
    new(
      params[:name], 
      Float(params[:weight]), 
      Integer(params[:boil_duration])
    )
  end
end
