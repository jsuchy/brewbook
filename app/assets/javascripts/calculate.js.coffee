class @ControlGroup
  constructor: ($group, name) ->
    @$ = $group
    @$help = $group.find('.help-inline')
    @name = name

  setErrorMessage: (errors) ->
    value = errors[@name]
    if value
      @$.addClass('error')
      @$help.text(value)
    else
      @$.removeClass('error')
      @$help.text("")

class @StrikeWaterTemperatureAndVolumeCalculator
  constructor: ($form, $strikeTemperatureResult, $waterVolumeResult, observers) ->
    @$form = $form
    @$strikeTemperatureResult = $strikeTemperatureResult
    @$waterVolumeResult = $waterVolumeResult
    @observers = observers

  calculate: ->
    $.post "/calculate/strike_water_temperature_and_volume", @$form.serialize(), (data) =>
      if data.valid
        @$strikeTemperatureResult.text(data.strike_water_temperature)
        @$waterVolumeResult.text(data.mash_water_volume)
        @clearErrorMessages()
      else
        $.each @observers, (i) ->
          @.setErrorMessage(data.errors)

  clearErrorMessages: () ->
    $.each @observers, (i) ->
      @.setErrorMessage({})

$ ->
  observers = [new ControlGroup($("#mashTemperatureControlGroup"), "mash_temperature"),
               new ControlGroup($("#waterToGristControlGroup"), "ratio"),
               new ControlGroup($("#poundsControlGroup"), "pounds"),
               new ControlGroup($("#ouncesControlGroup"), "ounces")]
  calculator = new StrikeWaterTemperatureAndVolumeCalculator(
    $(".mash-calculator.page form"), $("#strikeTemperatureResult"), $("#waterVolumeResult"), observers
  )

  $(document).on 'submit', '.mash-calculator.page form', (event)->
    event.preventDefault()
    calculator.calculate()
    return false
