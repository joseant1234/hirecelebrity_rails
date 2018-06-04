$(document).on "turbolinks:load", ()->
  $('.dropdown-button').dropdown
    hover: true
    constrainWidth: false
  $('.modal').modal()
  Materialize.updateTextFields()
  $('select').material_select()
  $('textarea.count-textarea').characterCounter()
  $('ul.tabs').tabs()
  $('.materialboxed').materialbox()
  Materialize.Toast.removeAll()

  $('.photo_upload').on 'change', (e) ->
    have_image = readURL(this)
    checkbox_delete_photo = $('#upload').find('input[type=checkbox]').first()
    if !have_image && checkbox_delete_photo
      checkbox_delete_photo.prop "checked",true
    else if checkbox_delete_photo
      checkbox_delete_photo.prop 'checked', false
  readURL = (input) ->
    if (input.files && input.files[0])
      reader = new FileReader()
      reader.onload = (e) ->
        $('.image_to_upload').attr('src', e.target.result).removeClass('hidden').width(300).height(300)
      reader.readAsDataURL(input.files[0])
      return true
    else
      $('.image_to_upload').addClass('hidden')
      return false

  $(document).on 'click', '.delete-image', (event)->
    event.preventDefault()
    $('.photo_upload').trigger 'change'
    $(this).remove()


$(document).on 'click','.open-modal-confirmation',(event)->
  event.preventDefault()
  $('#modalConfirmation').modal 'open'
  url = $(this).data 'url'
  confirmation_text = $(this).data('confirmation-text')
  option_text = $(this).data('option-text')
  method = $(this).data('option-method')
  if !option_text
    option_text = 'archive'
  $("#modalConfirmation .confirmation-text").text("Are you sure to #{option_text} "+ confirmation_text + "?")
  $("#modalConfirmation").find("a").attr('href',url)
  if !method
    $("#modalConfirmation").find("a").attr('data-method','delete')
  else
    $("#modalConfirmation").find("a").attr('data-method',method)
  false;

$(document).on 'click', '.pagination-from-table .pagination a', ->
  $(this).closest('.pagination').html('Loading ...')
  $.get this.href, null, null, 'script'
  false

$(document).on 'click', '.send-wikipedia', (event)->
  event.preventDefault()
  $(this).addClass('disabled')
  celebrity_name = $("#celebrity_name").val()
  celebrity_last_name = $("#celebrity_last_name").val()
  $.get this.href, {celebrity_name: celebrity_name, celebrity_last_name: celebrity_last_name}, null, 'script'
  false

$(document).on 'nested:fieldAdded', (event)->
  $('select').material_select()
