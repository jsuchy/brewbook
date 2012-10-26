Brewery.NewRecipeView = Ember.View.extend
  tagName: 'form'
  templateName: 'new_recipe'

  submit: (event) ->
    event.preventDefault()
    @get('controller').save()
    return false
