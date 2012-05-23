$(document).ready ->
  $('form[data-remote]').ajaxForm()

$.fn.ajaxForm = ->
  @each (index, form) ->
    form = $(form)
    form.data 'ajax-form', new AjaxForm(form)


class AjaxForm
  constructor: (@form) ->
    @form.bind 'ajax:success', (e, model) =>
      @removeErrors()
      console.log model
      alert('woot')

    @form.bind 'ajax:error', (e, response) =>
      @removeErrors()
      errors = JSON.parse(response.responseText)
      for field_name of errors
        @addError(field_name, errors[field_name])

  removeErrors: ->
    @form.find('.control-group.error .controls .help-inline').remove()
    @form.find('.control-group').removeClass('error')

  addError: (field_name, errors) ->
    input = @form.find("[name$=\\[#{field_name}\\]]")
    group = input.closest('.control-group')
    group.addClass('error')
    $('<span>').addClass('help-inline').text(errors.join(', ')).insertAfter(input)
