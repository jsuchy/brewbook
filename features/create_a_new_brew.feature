Feature: Create a new brew

  Scenario: A proper brew
    Given a brew with a name of "West Coast Blaster"
    And a grain with a name of "Pale Ale" and weight of "12.25" pounds
    And a grain with a name of "Municy 10L" and weight of "1.0" pound
    And a grain with a name of "Caramel 40L" and weight of "1.0" pound
    And a grain with a name of "TF&S Dark Crystal (II)" and weight of "0.5" pounds
    And a grain with a name of "Victory" and weight of "0.5" pounds
    And a grain with a name of "Pale Chocolate Malt" and weight of "3.0" ounces
    And a hop with with a name of "Horizon 9.1% (pellets)", weight of "0.45" ounces, and a boil duration of "60" minutes
    And a hop with with a name of "Magnum 13.1% (pellets)", weight of "1.0" ounce, and a boil duration of "60" minutes
    And a hop with with a name of "Cascade 8.1%", weight of "1.0" ounce, and a boil duration of "10" minutes
    And a hop with with a name of "Centenmal 10.3%", weight of "1.0" ounce, and a boil duration of "10" minutes
    And a hop with with a name of "Centenmal 8.7% (pellets)", weight of "0.65" ounces, and a boil duration of "10" minutes
    And a hop with with a name of "Cascade 8.1%", weight of "1.0" ounce, and a boil duration of "0" minutes
    And a hop with with a name of "Centenmal 10.3%", weight of "1.0" ounce, and a boil duration of "0" minutes
    And a mash time of "60" minutes
    And a mash temperature of "152" degrees Fahrenheit
    And a yeast of "Saface US-05"
    And a yeast amount of "23g in 2 cups boiled water"
    And a pre-boil gravity of "1.042"
    And a original gravity of "1.066"
    And a final gravity of "1.011"
    And a carbonation volume of "2.5"
    And a fermentation duration of "14" days
    And a fermentation temperature of "65" degrees Fahrenheit
    And a date of today
    When I save the brew
    Then my list of brews will contain the created brew
