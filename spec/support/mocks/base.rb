module Mocks
  class Base
    def self.attributes(*attrs)
      attrs.each do |attr|
        define_method(attr) do
          @attrs[attr] || raise("Called: #{attr}, when #{attr} was not set")
        end
      end
    end

    def initialize(attributes)
      @attrs = attributes
    end

  end
end
