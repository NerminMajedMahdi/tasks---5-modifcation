class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # adding field first_name  last_name to devise
 # before_action :configure_permitted_parameters, if: :devise_controller?

   # protected

   # def configure_permitted_parameters
     # devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
   # end

end


def index
  if params[:q]
    search_term = params[:q]
    @products = Product.search(search_term)
  else
    @products = Product.all
  end
end





  
