module Mocks
  class Base
    def self.attributes(*attrs)
      attrs.each do |attr|
        class_eval(<<-RUBY)
        def #{attr}
          @attrs[#{attr.inspect}] || raise("Called: #{attr}, when #{attr} was not set")
        end
        RUBY
      end
    end

    def initialize(attributes)
      @attrs = attributes
    end

  end
end
