require 'brewery/loaders/grain'

module Brewery
  class Grain
    def self.all
      @@grains ||= Brewery::Loader::Grain.new.execute
    end

    attr_reader :id, :name

    def initialize(id, name)
      @id = id
      @name = name
    end

  end
end
