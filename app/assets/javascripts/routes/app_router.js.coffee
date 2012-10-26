Brewery.Router = Ember.Router.extend
  location: 'hash'
  enableLogging:  true

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'
      enter: (router) ->
        router.transitionTo("recipes.new")

    recipes: Ember.Route.extend
      showRecipe:  Ember.Route.transitionTo('recipes.recipe')
      route: '/recipes'
      new: Ember.Route.extend
        route: "/new"
        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('newRecipe')
      recipe: Ember.Route.extend
        route: "/recipe/:id"
        deserialize:  (router, context) ->
          Brewery.Recipe.find( context.id )
        serialize: (router, context) ->
          { id: context.id }
        connectOutlets: (router, aRecipe) ->
          router.get('applicationController').connectOutlet('recipe', aRecipe)

