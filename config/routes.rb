Benrangel::Application.routes.draw do
  resources :users

  match '/*path' => 'static#view', :as => :static
  root :to => 'static#view'
end
