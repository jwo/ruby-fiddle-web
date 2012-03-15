$ ->
  editor = CodeMirror.fromTextArea(document.getElementById("riddle_code"),
     mode: "text/x-ruby",
     tabMode: "indent",
     matchBrackets: true,
     indentUnit: 2,
     lineNumbers: true,
     theme: 'rubyblue'
    )
  
  $(".segmented_control button").on "click", ->
    $("button.selected_binding").removeClass('selected_binding')
    editor.setOption('keyMap', $(this).val())
    $(this).addClass('selected_binding')
  
  
  $("#create_gist").on "click", ->
    gistData = {
          "public": true,
          "files": {
            "rubyfiddle_riddle.rb": {
              "content": editor.getValue()
            }
          }
        }
  
    $.ajax
      type: 'POST',
      url: "https://api.github.com/gists",
      crossDomain: true,
      username: '',
      password: '',
      data: gistData,
      contentType: "application/json",
      dataType: "jsonp",
      success: (data)->
        console.log "CAME TO SUCCESS"
        console.log data

      error: (data)->
        console.log "CAME TO ERROR"
        console.log data
			
	$("#save_riddle").on "click", ->
		$.ajax
			type: 'POST',
			url: "/riddles/",
			data: $("#riddle_form").serialize(),
			dataType: "script"
	$("#update_riddle").on "click", ->
		$.ajax
			type: 'PUT',
			url: $(this).data("update-url"),
			data: $("#riddle_form").serialize(),
			dataType: "script"
	$("#fork_riddle").on "click", ->
		$.ajax
			type: 'PUT',
			url: $(this).data("fork-url"),
			data: $("#riddle_form").serialize(),
			dataType: "script"
