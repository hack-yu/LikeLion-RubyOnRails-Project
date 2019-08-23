Rails.application.routes.draw do
  
  root 'homes#index'
  
  # surveys
  get 'surveys/:id/preview' => 'surveys#preview'
  get 'surveys/link'
  get 'surveys/:id/result' => 'surveys#result'

  # responser
  get 'responsers/index'
  get 'responsers/new'
  post 'responsers/r_create'
  
  #post 'questions/create/:params' => 'questions#create'#, as: 'question_create'
  #post 'questions/create' # 이렇게 하는게 아닌거 같음
  
  resources :surveys do
    resources :questions, except: [:show]

    get 'questions/preview/:id' => 'questions#preview', as: 'q_preview'
    get 'questions/etc'
    post 'questions/create' => 'questions#create'
    post 'questions/preview_update/:id' => 'questions#preview_update', as: 'q_p_update'
  end

  ## 설문 응답자
  # get 'responsers/questions/:id' => 'responsers#questions', as: 'q_responser'
  get 'surveys/:survey_id/responsers/new' => 'responsers#new'
  get 'surveys/:survey_id/responsers/question/:order' => 'responsers#question', as: 'r_q_order'
  post 'responsers/question/:id/answer' => 'responsers#answer', as: 'responsers_answer'
  
 
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  #devise_for :users 
  #resources :posts
  #resources :posts do
    #resources :comments
  #end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
