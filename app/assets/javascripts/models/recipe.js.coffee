Brewery.Recipe = DS.Model.extend
  name: DS.attr('string')
  waterToGrist: DS.attr('number', {defaultValue: 1.5})
  targetTemperature: DS.attr('number')
  strikeWaterTemperature: DS.attr('number')
  mashWaterVolume: DS.attr('number')

  weightedGrains: DS.hasMany('Brewery.WeightedGrain')

  totalWeight: (->
    weight = 0
    @get('weightedGrains').forEach (grain) ->
      weight += grain.get('weight')
    weight
  ).property('weightedGrains.length')

