jQuery ->
  $('#training_sessions').sortable(
    axis: 'y'
    handle: '.handle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );
  $('#training_session_site_ids').chosen()