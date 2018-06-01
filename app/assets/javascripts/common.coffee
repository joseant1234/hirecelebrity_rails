$(document).on "turbolinks:load", ()->
  Materialize.updateTextFields()
  notice = $('#notice').text()
  if notice.length > 0
    Materialize.toast(notice, 4000, 'rounded')
    $('#notice').text('')
    
$(document).on 'keypress','.only-integer', (event)->
  return event.charCode >= 48 && event.charCode <= 57
