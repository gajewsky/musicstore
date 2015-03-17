class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccesDenied do |exception|
    redirect_to root_path, notice: "You are not authorized to acces this area"  
  end

end
