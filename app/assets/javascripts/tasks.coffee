# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#new_task').submit((e) ->
      e.preventDefault()
      $.ajax({
        url: $(this).attr('action'),
        method: 'post',
        dataType: 'json',
        data: $(this).serialize(),
      }).success((data) ->
        $("#non_urgent_tasks").find("ul")
            .prepend("<li><a href=\"/tasks/#{data.id}/edit\">#{data.description}</a>")
      )
    )