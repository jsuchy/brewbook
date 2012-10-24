Feature: Calculate strike volume and temperature
  In order to avoid doing math in my head
  As a brewer
  I want the system to calculate the strike temperature and volume

  Scenario: 15.25 pounds of grain with a 1.75 water to grist ratio
    Given I have a recipe that calls for 15.25 pounds of grain
    And a target mash temperature of 154
    And a water to grist ratio of 1.75
    When the strike water calculations are done
    Then the strike water temperature is 163
    And the water volume needed is 26.7

  Scenario: 10 pounds of grain with a 2.0 water to grist ratio
    Given I have a recipe that calls for 10 pounds of grain
    And a target mash temperature of 154
    And a water to grist ratio of 2.0
    When the strike water calculations are done
    Then the strike water temperature is 162
    And the water volume needed is 20
