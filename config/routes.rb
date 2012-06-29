Earlyvoter::Application.routes.draw do
  resources :voters
  root :to => 'voters#new'
end
