describe "StrikeWaterTemperatureAndVolumeCalculator", ->
  calculator = null
  $form = null
  $strikeTemperatureResult = null
  $waterVolumeResult = null
  observers = null

  beforeEach () ->
    $form = jasmine.createSpyObj("$form", ['serialize'])
    $strikeTemperatureResult = jasmine.createSpyObj("$strikeTemperatureResult", ['text'])
    $waterVolumeResult = jasmine.createSpyObj("$waterVolumeResult", ['text'])
    $observer = jasmine.createSpyObj("$observer", ['setErrorMessage'])
    observers = [ $observer ]
    calculator = new StrikeWaterTemperatureAndVolumeCalculator(
      $form, $strikeTemperatureResult, $waterVolumeResult, observers
    )

  describe "#calculate", ->
    describe "when valid", ->
      beforeEach ->
        spyOn($, "post").andCallFake (location, data, cb) ->
          cb({valid: true, strike_water_temperature: 10, mash_water_volume: 5})
        calculator.calculate()

      it "clears the errors from the observers", ->
        $.each observers, (i) ->
          expect(@.setErrorMessage).toHaveBeenCalledWith({})

      it "sets the $strikeTemperatureResult", ->
        expect($strikeTemperatureResult.text).toHaveBeenCalledWith(10)

      it "sets the $waterVolumeResult", ->
        expect($waterVolumeResult.text).toHaveBeenCalledWith(5)

    describe "when invalid", ->
      msg = "is not a valid number."
      errors = {pounds: msg, ounces: msg, mash_temperature: msg, ratio: msg}
      beforeEach ->
        spyOn($, "post").andCallFake (location, data, cb) ->
          cb({valid: false, errors: errors})
        calculator.calculate()

      it "sets the correct error variables", ->
        $.each observers, (i) ->
          expect(@.setErrorMessage).toHaveBeenCalledWith(errors)

      describe "after correcting the errors", ->
        beforeEach ->
          $.post.andCallFake (location, data, cb) ->
            cb({valid: true, strike_water_temperature: 10, mash_water_volume: 5})
          calculator.calculate()

        it "sets the errors to null", ->
          $.each observers, (i) ->
            expect(@.setErrorMessage).toHaveBeenCalledWith({})
