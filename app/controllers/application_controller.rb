class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # adding field first_name  last_name to devise
 # before_action :configure_permitted_parameters, if: :devise_controller?

   # protected

   # def configure_permitted_parameters
     # devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
   # end

 module API
  extend ActiveSupport::Concern

  included do
    rescue_from ::CanCan::AccessDenied do
      error!('403 Forbidden', 403)
    end
  end
  # Convienience method to authorize every route
  def authorize_routes!
    before { authorize_route! }
  end
end
  end




def index
  if params[:q]
    search_term = params[:q]
    @products = Product.search(search_term)
  else
    @products = Product.all
  end
end





  
