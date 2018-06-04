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
