Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :essays do
    resources :research_cards
    resources :sections
    resources :sources
    member do
      get 'to_pdf'
    end
  end

  get '/essays/:essay_id/sections/:id/draft_edit', to: 'sections#edit_final', as: 'edit_final_essay_section'

  root "essays#index"
end
