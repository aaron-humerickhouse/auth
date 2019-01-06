Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  scope :api do
    scope :v1 do
      use_doorkeeper scope: 'oauth2' do
        skip_controllers :applications, :authorized_applications
      end
    end
  end

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {
            registrations: 'api/v1/users/registrations',
        }, skip: [:sessions, :password]
    end
  end
end
