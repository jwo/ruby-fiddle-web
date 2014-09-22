$ ->
  $("#run_riddle").on "click", (event) =>
    event.preventDefault()
    root.codeEditor.save()
    $("#run_riddle .c").addClass("rotate")
    $("#riddle_form").trigger("submit.rails")

  $("#save_riddle").on "click", (event) ->
      event.preventDefault()
      root.codeEditor.save()
      $.ajax
          type: 'POST',
          url: "/riddles/",
          data: $("#riddle_form").serialize(),
          dataType: "script"
  $("#update_riddle").on "click", (event)  ->
      event.preventDefault()
      root.codeEditor.save()
      $.ajax
          type: 'PUT',
          url: $(this).data("update-url"),
          data: $("#riddle_form").serialize(),
          dataType: "script"
  $("#fork_riddle").on "click", (event)  ->
      event.preventDefault()
      root.codeEditor.save()
      $.ajax
          type: 'PUT',
          url: $(this).data("fork-url"),
          data: $("#riddle_form").serialize(),
          dataType: "script"


  root = exports ? this
  root.codeEditor = CodeMirror.fromTextArea document.getElementById("riddle_code"),
      mode: "text/x-ruby",
      tabMode: "spaces",
      matchBrackets: true,
      indentUnit: 2,
      lineNumbers: true,
      theme: 'vibrant-ink'

  $(".key-bindings a").on "click", ->
      $(".key-bindings a").removeClass('selected')
      root.codeEditor.setOption('keyMap', $(this).data("keybinding"))
      $(this).addClass('selected')
