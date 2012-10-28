describe "Controllers", ->
  describe "MashCalculatorController", ->
    controller = null

    beforeEach ->
      controller = Brewery.MashCalculatorController.create()

    describe "#calculate", ->
      describe "when valid", ->
        postUrl = null

        beforeEach ->
          spyOn($, "post").andCallFake (location, data, cb) ->
            postUrl = location
            cb({valid: true, strike_water_temperature: 10, mash_water_volume: 5})
          controller.calculate()

        it "sets the correct variables", ->
          expect(controller.get('strikeTemperature')).toEqual 10
          expect(controller.get('waterVolume')).toEqual 5

        it "posts to the correct location", ->
          expect(postUrl).toEqual "/calculate/strike_water_temperature_and_volume"

      describe "when invalid", ->
        msg = "is not a valid number."

        beforeEach ->
          spyOn($, "post").andCallFake (location, data, cb) ->
            cb({valid: false, errors: {pounds: msg, ounces: msg, target_temp: msg, ratio: msg}})
          controller.calculate()

        it "sets the correct error variables", ->
          expect(controller.get('poundsError')).toEqual msg
          expect(controller.get('ouncesError')).toEqual msg
          expect(controller.get('mashTemperatureError')).toEqual msg
          expect(controller.get('waterToGristError')).toEqual msg

        describe "after correcting the errors", ->
          beforeEach ->
            $.post.andCallFake (location, data, cb) ->
              cb({valid: true, strike_water_temperature: 10, mash_water_volume: 5})
            controller.calculate()

          it "sets the errors to null", ->
            expect(controller.get('poundsError')).toEqual null
            expect(controller.get('ouncesError')).toEqual null
            expect(controller.get('mashTemperatureError')).toEqual null
            expect(controller.get('waterToGristError')).toEqual null

