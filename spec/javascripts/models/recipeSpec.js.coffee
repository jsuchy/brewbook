describe "Models", ->
  describe "RecipeModel", ->
    store = undefined

    beforeEach ->
      store = DS.Store.create({revision: 6})

    it "calculates the correct total weight", ->
      store.loadMany(
        Brewery.WeightedGrain,
        [1,2],
        [
          {id: 1, weight: 4.0 },
          {id: 2, weight: 3.2 }
        ])
      store.load(Brewery.Recipe, 1, {id: 1, weightedGrains: [1,2]})

      model = store.find(Brewery.Recipe, 1)

      expect(model.get("totalWeight")).toEqual 7.2

      model.get('weightedGrains').createRecord({weight: 1})

      expect(model.get("totalWeight")).toEqual 8.2


