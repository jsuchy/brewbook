Brewery.WeightedGrain = DS.Model.extend
  weight: DS.attr("number")
  recipe: DS.belongsTo("Brewery.Recipe")
  grain: DS.belongsTo("Brewery.Grain")

  didCreate: ->
    # Re-GET the backing data to populate associations that were wiped out during nested creation.
    Ember.run.next(@, ->
      @get('recipe.weightedGrains').pushObject(@))
