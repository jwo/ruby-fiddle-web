<% if @riddle.errors.any? %>
	error_message = "<%= escape_javascript(@riddle.errors.full_messages.join(', ')) %>";
	$(".form-field.error").remove();
	$("<div class='form-field error'><small>#{error_message}</small></div>").insertBefore("#riddle_form input.code");
	$("#riddle_form").parent().effect("highlight", {}, 3000);
<% else %>
  window.location.replace("<%= url_for(versioned_riddle_path(@riddle, @riddle.versions.count)) %>");
<% end %>
