$(document).on "turbolinks:load", ()->
  $('.modal').modal()
  $('select').material_select()
  $(".dropdown-button").dropdown()
  $(".button-collapse").sideNav()
  $('.slider').slider()
