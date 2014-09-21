$ ->
  $("#run_riddle").on "click", (event) =>
    event.preventDefault()
    root.codeEditor.save()
    $("#riddle_form").trigger("submit.rails")
  $("#save_riddle").on "click", (event) ->
      $(this).text("saving....")
      event.preventDefault()
      root.codeEditor.save()
      $.ajax
          type: 'POST',
          url: "/riddles/",
          data: $("#riddle_form").serialize(),
          dataType: "script"
  $("#update_riddle").on "click", (event)  ->
      $(this).text("updating....")
      event.preventDefault()
      root.codeEditor.save()
      $.ajax
          type: 'PUT',
          url: $(this).data("update-url"),
          data: $("#riddle_form").serialize(),
          dataType: "script"
  $("#fork_riddle").on "click", (event)  ->
      $(this).text("forking....")
      event.preventDefault()
      root.codeEditor.save()
      $.ajax
          type: 'PUT',
          url: $(this).data("fork-url"),
          data: $("#riddle_form").serialize(),
          dataType: "script"
  $("#create_gist").on "click", (event)  ->
      $(this).text("gistifying....")
      event.preventDefault()
      gistData = {"gist_content": root.codeEditor.getValue() }
      $.ajax
          type: 'POST',
          url: "/riddles/gistify",
          data: JSON.stringify(gistData),
          contentType: "application/json",
          dataType: "json",
          success: (data)->
              console.log data
              window.open data.gist_url
          error: (data)->
              console.log data

  root = exports ? this
  root.codeEditor = CodeMirror.fromTextArea document.getElementById("riddle_code"),
      mode: "text/x-ruby",
      tabMode: "indent",
      matchBrackets: true,
      indentUnit: 2,
      lineNumbers: true,
      theme: 'rubyblue'

  $(".segmented_control button").on "click", ->
      $("button.selected_binding").removeClass('selected_binding')
      root.codeEditor.setOption('keyMap', $(this).val())
      $(this).addClass('selected_binding')
