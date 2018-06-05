$(document).on 'click', '.open-video-modal', ()->
  event.preventDefault()
  url = $(this).text()
  if url
    $('#modalShowVideo iframe').attr 'src', url
    $('#modalShowVideo').modal 'open'
  false
