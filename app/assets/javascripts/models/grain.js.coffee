Brewery.Grain = DS.Model.extend
  name: DS.attr('string')
  weightedGrains: DS.hasMany('Brewery.WeightedGrain')

