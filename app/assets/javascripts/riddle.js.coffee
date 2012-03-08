$ ->
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
