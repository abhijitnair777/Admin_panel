Rails.application.routes.draw do
  
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'homepages#index'
  
    resources :books, only: [:index, :show] do
  	  collection do
  	    put 'show_multiple'
  	  end  
    end	
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
