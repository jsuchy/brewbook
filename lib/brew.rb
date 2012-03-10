require "active_support/core_ext/hash/indifferent_access"

class Brew
  attr_reader :name, :brew_date

  def initialize(attributes)
    attributes = attributes.with_indifferent_access
    @name = attributes[:name]
    @brew_date = attributes[:brew_date]
  end

  def valid?
    return false if @name.nil? || @brew_date.nil?
    true
  end
end
