describe "Models", ->
  describe "MashCalculator", ->
    describe "#serialize", ->
      it "correctly sets its properties", ->
        attributes = {waterToGrist: 1.6, mashTemperature: 160, pounds: 10, ounces: 3.2}
        model = Brewery.MashCalculator.create(attributes)
        expect(model.serialize()).toEqual(attributes)
