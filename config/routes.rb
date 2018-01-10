Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :essays do
    resources :research_cards
    resources :sections
    resources :sources
  end

  get '/essays/:essay_id/sections/draft_edit/:id', to: 'sections#edit_final', as: 'edit_final_essay_section'
  root "essays#index"
end
