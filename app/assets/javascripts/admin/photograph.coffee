$(document).on 'change', '.select-section', ()->
  section = $(this).val()
  if section && section == "<%= Photograph.sections.keys[1] %>"
    $("#section_banner_fields").fadeIn('slow')
  else if section
    $("#section_banner_fields").fadeOut('slow')
