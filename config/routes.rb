Rubyfiddle::Application.routes.draw do
  root to: "riddles#index"
  resources :riddles do
    member do
      put :fork
    end
  end
  match 'riddles/:id/:version' => 'riddles#show', :as => :versioned_riddle, :constraints => { :version=> /\d*/}
  match 'plays/run' => "plays#run", as: :play
end
