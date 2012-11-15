module Interface
  module Hop; end
end

shared_examples_for Interface::Hop do |host|
  has_properties host, :name, :weight, :boil_duration
end
