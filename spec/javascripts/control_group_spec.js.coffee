describe "ControlGroup", ->
  group = null
  help = null
  controlGroup = null

  beforeEach () ->
    group = jasmine.createSpyObj('group', ['find', 'addClass', 'removeClass'])
    help = jasmine.createSpyObj('help', ['text'])
    group.find.andReturn(help)

  describe ".new", ->
    it "sets the help object based on the group object", ->
      controlGroup = new ControlGroup(group, "pounds")
      expect(group.find).toHaveBeenCalledWith(".help-inline")
      expect(controlGroup.$help).toBe(help)

  describe "#setErrorMessage", ->
    errors = null
    beforeEach () ->
      controlGroup = new ControlGroup(group, "pounds")

    describe "when there is an error that matches its name", ->
      msg = null

      beforeEach () ->
        msg = "is not a valid number."
        errors = {pounds: msg}

      it "adds the error class to its self", ->
        controlGroup.setErrorMessage(errors)
        expect(group.addClass).toHaveBeenCalledWith("error")

      it "sets the helps text to the error msg", ->
        controlGroup.setErrorMessage(errors)
        expect(help.text).toHaveBeenCalledWith(msg)

    describe "when there isn't an error that matches its name", ->
      beforeEach () ->
        errors = {}

      it "removes the error class from its self", ->
        controlGroup.setErrorMessage(errors)
        expect(group.removeClass).toHaveBeenCalledWith("error")

      it "clears the helps text", ->
        controlGroup.setErrorMessage(errors)
        expect(help.text).toHaveBeenCalledWith("")

