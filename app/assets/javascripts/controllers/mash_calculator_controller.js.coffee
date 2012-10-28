Brewery.MashCalculatorController = Ember.ObjectController.extend
  init: ->
    @_super()
    @set 'content', Brewery.MashCalculator.create(waterToGrist: 1.5)

  calculate: ->
    $.post "/calculate/strike_water_temperature_and_volume", @get('content').serialize(), (data) =>
      @set('strikeTemperature', data.strike_water_temperature)
      @set('waterVolume', data.mash_water_volume)
