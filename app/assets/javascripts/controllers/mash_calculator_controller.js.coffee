Brewery.MashCalculatorController = Ember.ObjectController.extend
  init: ->
    @_super()
    @set 'content', Brewery.MashCalculator.create(waterToGrist: 1.5)

  calculate: ->
    $.post "/calculate/strike_water_temperature_and_volume", @get('content').serialize(), (data) =>
      if data.valid
        @set('strikeTemperature', data.strike_water_temperature)
        @set('waterVolume', data.mash_water_volume)
        @set('poundsError', null)
        @set('ouncesError', null)
        @set('mashTemperatureError', null)
        @set('waterToGristError', null)
      else
        @set('poundsError', data.errors.pounds)
        @set('ouncesError', data.errors.ounces)
        @set('mashTemperatureError', data.errors.target_temp)
        @set('waterToGristError', data.errors.ratio)
