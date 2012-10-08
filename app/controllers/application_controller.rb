class ApplicationController < ActionController::Base
  protect_from_forgery
  

  #Nuevo código sacado del gist

rescue_from CanCan::AccessDenied do |exception|
  respond_to do |format|
    format.html do
      redirect_to admin_root_path, :alert=>exception.message
    end
  end
end

def current_ability
  @current_ability ||=  Ability.new(current_admin_user)
end
  
end
