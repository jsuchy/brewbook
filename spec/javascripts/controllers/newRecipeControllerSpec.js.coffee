describe "Controllers", ->
  describe "NewRecipeController", ->
    controller = undefined
    beforeEach ->
      controller = Brewery.NewRecipeController.create()

    it "adds grains based on its selected grain", ->
      controller.set "selectedGrain", Brewery.Grain.createRecord(name: "Wheat")
      controller.set "amount", "10.2"
      controller.addGrain()
      expect(controller.get("content.totalWeight")).toEqual 10.2
