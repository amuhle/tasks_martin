module ErrorsHelper

	def render_error(*args)
		f = args[1]
		attribute = args[2]

		unless !args[0]
			errors_messages = args[0].errors.messages
			presence = errors_messages[attribute].present?
		else
			presence = false
		end

		html = ""
		if attribute.equal?(:current_password)
			html += "<div "+ (presence ? "style='color : #b94a48'" : "")+"> "+
			f.label(attribute, class: "inline") +	" <i class='info_password'>(we need your current password to confirm your changes)</i><br/> "+ f.password_field(attribute, style: (presence ? "border-color: #953b39;" : "")) +	" <span class='help-inline' "+ (presence ? "style='color : #b94a48'" : "") +">"+ (presence ? attribute.to_s.capitalize+" "+errors_messages[attribute][0] : "") +"</span> "+" </div>"
		else
			html +=
		  "<div class='control-group" + (presence ? " error'" : "'") +"> "+
		    f.label(attribute, :class => 'control-label') +
		    "<div class='controls'>"

	  	if attribute.equal?(:email)
				html += f.email_field(attribute, :class => 'text_field')
			elsif attribute.equal?(:password) | attribute.equal?(:password_confirmation) | attribute.equal?(:current_password)
				html += f.password_field(attribute, :class => 'text_field')
			else
				html += f.text_field(attribute, :class => 'text_field')
			end

	    html += "<span class='help-inline'>"+ (presence ? attribute.to_s.capitalize+" "+errors_messages[attribute][0] : "") +"</span>"+
		    "</div>
		  </div>"
		end
		raw(html)
	end

end
