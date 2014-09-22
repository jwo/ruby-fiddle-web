Rubyfiddle::Application.routes.draw do
  root to: "riddles#index"
  resources :riddles do
    member do
      put :fork
    end
  end
  get 'riddles/:id/:version' => 'riddles#show', :as => :versioned_riddle, :constraints => { :version=> /\d*/}
  post 'plays/run' => "plays#run", as: :play
end
