require 'brewery/use_cases/calculate_strike_temperature_and_volume'

Given /^I have a recipe that calls for (\d*\.?\d+) pounds of grain$/ do |pounds|
  @pounds = pounds.to_f
end

Given /^a target mash temperature of (\d+)$/ do |temp|
  @target_temp = temp.to_i
end

Given /^a water to grist ratio of (\d*\.?\d+)$/ do |ratio|
  @ratio = ratio.to_f
end

When /^the strike water calculations are done$/ do
  @result = Brewery::UseCase::CalculateStrikeTemperatureAndVolume.new(@pounds, @target_temp, @ratio).execute
end

Then /^the strike water temperature is (\d*\.?\d+)$/ do |temp|
  @result[:strike_water_temperature].should == temp.to_f
end

Then /^the water volume needed is (\d*\.?\d+)$/ do |volume|
  @result[:mash_water_volume].should == volume.to_f
end
