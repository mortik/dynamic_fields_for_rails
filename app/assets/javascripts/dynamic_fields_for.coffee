$ ->
  $(document).off 'click', 'form .remove_fields'
  $(document).off 'click', 'form .add_fields'

  $(document).on 'click', 'form .remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.fields').hide()
    $(document).trigger('dynamicFieldsFor.remove', @)
    event.preventDefault()

  $(document).on 'click', 'form .add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $(document).trigger('dynamicFieldsFor.add', @)
    event.preventDefault()
