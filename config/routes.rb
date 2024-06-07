Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'articles#index', as: :authenticated_root
  end

  unauthenticated do
    devise_scope :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # Custom routes for articles
  get '/articles', to: 'articles#index', as: 'articles'
  get '/articles/new', to: 'articles#new', as: 'new_article'
  post '/articles', to: 'articles#create'
  get '/articles/:id', to: 'articles#show', as: 'article'
  get '/articles/:id/edit', to: 'articles#edit', as: 'edit_article'
  patch '/articles/:id', to: 'articles#update'
  delete '/articles/:id', to: 'articles#destroy'
  get '/my_articles', to: 'articles#my_article', as:'my_article'

  # Custom routes for comments
  get '/articles/:article_id/comments', to: 'comments#index', as: 'article_comments'
  get '/articles/:article_id/comments/new', to: 'comments#new', as: 'new_article_comment'
  post '/articles/:article_id/comments', to: 'comments#create'
  get '/articles/:article_id/comments/:id', to: 'comments#show', as: 'article_comment'
  delete '/articles/:article_id/comments/:id', to: 'comments#destroy'
end
