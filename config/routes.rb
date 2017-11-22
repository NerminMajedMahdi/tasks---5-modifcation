Rails.application.routes.draw do


resources :products do
  resources :comments
end
resources :users

devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, :controllers => {:registrations => "user_registrations"}

resources :orders, only: [:index, :show, :create, :destroy]


root 'static_pages#landing_page'

get '/static_pages/about'

get 'static_pages/contact'

get 'static_pages/landing_page'

get 'static_pages/index'

get 'static_pages/thank_you'

post 'static_pages/thank_you'




end




