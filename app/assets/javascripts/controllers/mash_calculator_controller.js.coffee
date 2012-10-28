Brewery.MashCalculatorController = Ember.ObjectController.extend
  init: ->
    @_super()
    @set 'content', Brewery.MashCalculator.create(waterToGrist: 1.5)

  calculate: ->
    $.post "/mash_calculator", @get('content').serialize(), (data) =>
      json = JSON.parse(data)
      @set('strikeTemperature', json.strike_temperature)
      @set('waterVolume', json.water_volume)
