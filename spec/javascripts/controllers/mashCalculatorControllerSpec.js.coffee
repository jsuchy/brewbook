describe "Controllers", ->
  describe "MashCalculatorController", ->
    controller = null

    beforeEach ->
      controller = Brewery.MashCalculatorController.create()

    describe "#calculate", ->
      postUrl = null

      beforeEach ->
        spyOn($, "post").andCallFake (location, data, cb) ->
          postUrl = location
          cb(JSON.stringify({strike_temperature: 10, water_volume: 5}))

      it "sets the correct variables", ->
        controller.calculate()
        expect(controller.get('strikeTemperature')).toEqual 10
        expect(controller.get('waterVolume')).toEqual 5

      it "posts to the correct location", ->
        controller.calculate()
        expect(postUrl).toEqual "/calculate/strike_water_temperature_and_volume"

