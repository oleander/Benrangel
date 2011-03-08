Benrangel::Application.routes.draw do
  match '/*path' => 'static#view', :as => :static
  root :to => 'static#view'
end
