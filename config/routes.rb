Rails.application.routes.draw do |map|
  match 'tom' => 'tom#index'
  match 'ssi(/:action(/:id(.:format)))', :controller => 'ssi'
end