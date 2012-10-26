require 'spec_helper'
require 'brewery/loaders/grain'

describe Brewery::Loader::Grain do
  before do
    @grain_loader = Brewery::Loader::Grain.new
  end

  it "reads config/grains.csv" do
    File.should_receive(:read).with("#{`pwd`.strip}/config/grains.csv").and_return("")

    @grain_loader.execute
  end

  it "creates grain objects from the csv contents" do
    csv = "1,eric\n2,alex\n3,ben"
    File.should_receive(:read).and_return(csv)

    grains = @grain_loader.execute

    name_map = grains.map(&:name)
    %w[eric alex ben].each do |name|
      name_map.should include(name)
    end
  end

  it "sets the ids of the grains" do
    csv = "1,eric\n2,alex\n3,ben"
    File.should_receive(:read).and_return(csv)

    grains = @grain_loader.execute

    id_map = grains.map(&:id)
    [1, 2, 3].each do |id|
      id_map.should include(id)
    end
  end
end
