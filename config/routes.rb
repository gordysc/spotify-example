Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      'sign_in': 'login',
      'sign_out': 'logout'
    },
    controllers: {
      'omniauth_callbacks': 'omniauth_callbacks'
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resource :profile, only: :show
end
