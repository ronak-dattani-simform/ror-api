Rails.application.routes.draw do
  
  get "api/articles/search", to: "api/articles#search"
  namespace "api" do 
      resources :articles do 
        resources :comments
      end
  end

end
