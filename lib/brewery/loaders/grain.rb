module Brewery
  module Loader
    class Grain

      def execute
        grains = []

        _read_csv.split("\n").each do |line|
          id, name = line.split(",")
          grains << Brewery::Grain.new(id.to_i, name)
        end

        grains
      end

      private

      def _read_csv
        File.read(_path_to_csv)
      end

      def _path_to_csv
        File.expand_path(File.dirname(__FILE__)+"/../../../config/grains.csv")
      end

    end
  end
end
