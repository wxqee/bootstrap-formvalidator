# ------------------------------------------------------------
# Form Validator
# ------------------------------------------------------------
# Author: Wang Xiaoqiang <xq21@163.com>
# Requires:
#   * jquery 1.11
#   * bootstrap core 3+

do ($) ->

  settings =
    dataStoreKey: '_validate_data_store'

  isFormValid = ->
    if $(this).find('.has-error').length > 0
      return false
    else
      return true

  validateItem = ->
    $el = $(this)
    elName = $el.prop 'name'
    $form = $el.closest 'form'
    dataStore = $form.data settings.dataStoreKey

    $fg = $el.closest('.form-group')
    $msg = $fg.find('.help-block')

    $fg.removeClass 'has-error'
    $msg.html ""
    if not dataStore[elName].validate.call $el, $el.val()
      $fg.addClass 'has-error'
      $msg.text dataStore[elName].errorMessage

  validateAll = ->
    $form = $(this)
    $.each Object.keys($form.data settings.dataStoreKey), (i, name) ->
      validateItem.call $form.find "[name=" + name + "]"
    return isFormValid()

  onFormChange = (e) ->
    validateItem.call e.target

  onFormSubmit = (e) ->
    validateAll.call this
    isFormValid.call this

  validate = (options) ->
    $(this).data settings.dataStoreKey, options
    $(this).off 'change', onFormChange
    $(this).on 'change', onFormChange
    $(this).off 'submit', onFormSubmit
    $(this).on 'submit', onFormSubmit

    return this

  $.fn.formValidate = validate
  $.fn.formValidateNow = validateAll
