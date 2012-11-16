require 'brewery/brew'

module Brewery
  module UseCase
    class RetrieveListOfBrews

      def execute
        Records::Brew.all.map do |brew|
          Brewery::Brew.from_params(brew.attributes)
        end
      end

    end
  end
end
