$ ->

    
	$("#save_riddle").on "click", ->
		root.codeEditor.save()
		$.ajax
			type: 'POST',
			url: "/riddles/",
			data: $("#riddle_form").serialize(),
			dataType: "script"
	$("#update_riddle").on "click", ->
		root.codeEditor.save()
		$.ajax
			type: 'PUT',
			url: $(this).data("update-url"),
			data: $("#riddle_form").serialize(),
			dataType: "script"
	$("#fork_riddle").on "click", ->
		root.codeEditor.save()
		$.ajax
			type: 'PUT',
			url: $(this).data("fork-url"),
			data: $("#riddle_form").serialize(),
			dataType: "script"

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
