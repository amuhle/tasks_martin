module ErrorsHelper

	def render_error(*args)
		errors_messages = args[0].errors.messages
		f = args[1]
		attribute = args[2]

		presence = errors_messages[attribute].present?
		html =
	  "<div class='control-group" + (presence ? " error'" : "'") +"> "+
	    f.label(attribute, :class => 'control-label') +
	    "<div class='controls'>"+
	      f.text_field(attribute, :class => 'text_field')+
	      "<span class='help-inline'>"+ (presence ? attribute.to_s.capitalize+" "+errors_messages[attribute][0] : "") +"</span>"+
	    "</div>
	  </div>"
		raw(html)
	end

end
