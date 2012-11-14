require 'brewery/weighted_grain'
require 'brewery/hop'
require 'brewery/use_cases/create_a_brew'

Given /^a brew with a name of "(.*?)"$/ do |name|
  @name = name
end

Given /^a grain with a name of "(.*?)" and weight of "(.*?)" pound(?:s)?$/ do |name, weight|
  @grains ||= []
  @grains << Brewery::WeightedGrain.new(name, weight, 0)
end

Given /^a grain with a name of "(.*?)" and weight of "(.*?)" ounce(?:s)?$/ do |name, weight|
  @grains ||= []
  @grains << Brewery::WeightedGrain.new(name, 0, weight)
end

Given /^a hop with with a name of "(.*?)", weight of "(.*?)" ounce(?:s)?, and a boil duration of "(.*?)" minute(?:s)?$/ do |name, weight, boil_duration|
  @hops ||= []
  @hops << Brewery::Hop.new(name, weight, boil_duration)
end

Given /^a mash time of "(.*?)" minutes$/ do |mash_time|
  @mash_time = mash_time
end

Given /^a mash temperature of "(.*?)" degrees Fahrenheit$/ do |temp|
  @mash_temp = temp
end

Given /^a yeast of "(.*?)"$/ do |yeast|
  @yeast = yeast
end

Given /^a yeast amount of "(.*?)"$/ do |yeast_amount|
  @yeast_amount = yeast_amount
end

Given /^a fermentation duration of "(.*?)" days$/ do |time|
  @fermentation_duration = time
end

Given /^a fermentation temperature of "(.*?)" degrees Fahrenheit$/ do |temp|
  @fermentation_temperature = temp
end

Given /^a date of today$/ do
  @created_at = Time.now.midnight
end

Given /^a pre\-boil gravity of "(.*?)"$/ do |gravity|
  @pre_boil_gravity = gravity
end

Given /^a original gravity of "(.*?)"$/ do |gravity|
  @original_gravity = gravity
end

Given /^a final gravity of "(.*?)"$/ do |gravity|
  @final_gravity = gravity
end

Given /^a carbonation volume of "(.*?)"$/ do |volume|
  @carbonation_volume = volume
end

When /^I save the brew$/ do
  @brew = Brewery::UseCase::CreateABrew.new({
    :name => @name,
    :grains => @grains,
    :hops => @hops,
    :mash_time => @mash_time,
    :mash_temp => @mash_temp,
    :yeast => @yeast,
    :yeast_amount => @yeast_amount,
    :fermentation_duration => @fermentation_duration,
    :fermentation_temperature => @fermentation_temperature,
    :pre_boil_gravity => @pre_boil_gravity,
    :original_gravity => @original_gravity,
    :final_gravity => @final_gravity,
    :created_at => @created_at,
  }).execute
end

Then /^my list of brews will contain the created brew$/ do
  expect(Records::Brew.all).to include(@brew)
end
