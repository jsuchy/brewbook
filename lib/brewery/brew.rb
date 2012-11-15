Brewery::Brew = Struct.new(:name, :mash_temp, :mash_time, 
                           :yeast, :yeast_amount, :fermentation_temperature,
                           :fermentation_duration, :original_gravity,
                           :pre_boil_gravity, :final_gravity, :created_at)
