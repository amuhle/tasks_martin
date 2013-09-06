class Devise::RegistrationsControllerAux < DeviseController


	def update
    debugger
		self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if update_resource(resource, account_update_params)
      if is_navigational_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
      #redirect_to user_path(current_user.id)
      respond_with resource, :location => after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
		#super
		#redirect_to user_path(current_user.id)
	end

	def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

	def account_update_params
    debugger
    devise_parameter_sanitizer.sanitize(:account_update)
  end

end