Brewery.MashCalculator = Ember.Object.extend
  
  serialize: ->
    @getProperties('mashTemperature', 'waterToGrist', 'pounds', 'ounces')

