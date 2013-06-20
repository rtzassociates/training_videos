jQuery ->
  $('#video_tag_tokens').tokenInput '/tags.json',
    theme: 'facebook',
    animateDropdown: false,
    preventDuplicates: true,
    prePopulate: $('#photo_tag_tokens').data('load')