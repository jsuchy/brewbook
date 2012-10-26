Brewery.NewRecipeController = Ember.Controller.extend
  init: ->
    @_super()
    @set 'selectedGrain', null
    @set 'amount', null
    @set 'grains', Brewery.Grain.find()
    @set 'content', Brewery.Recipe.createRecord()
    Brewery.store.commit()

  addGrain: ->
    @get('content.weightedGrains').createRecord
      grain:  @get('selectedGrain')
      weight: parseFloat(@get('amount'))
    @set('selectedGrain', null)
    @set('amount', null)

  save: ->
    Brewery.store.commit()
    Brewery.get('router').transitionTo("recipes.recipe", @get("content"))
