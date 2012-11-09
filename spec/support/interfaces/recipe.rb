module Interface
  module Recipe; end
end

shared_examples_for Interface::Recipe do |host|
  [ :name, :grains, :hops, :mash_time, :mash_temp, :yeast, 
    :yeast_amount, :fermentation_instructions ].each do |attr|
    it "responds to #{attr}" do
      host.should respond_to(attr)
    end
  end
end
