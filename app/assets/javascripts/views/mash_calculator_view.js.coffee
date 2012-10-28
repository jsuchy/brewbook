Brewery.MashCalculatorView = Ember.View.extend
  tagName: 'form'
  classNames: ['mash-calculator form-horizontal']
  templateName: "mash_calculator"

  submit: (event) ->
    event.preventDefault()
    @get("controller").calculate()
    return false
