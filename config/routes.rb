Rails.application.routes.draw do
  #get"/",  controller => "movies", action: "index" 
  #get "/" => "movies#index"
  root "movies#index"

  resources :movies
  # Routes for the Movie resource:

  # # CREATE
  # post"/movies" => "movies#create", as: :movies # movies_path and movies_url
  # get"/movies/new" => "movies#new", as: :new_movie # new_movie_path and new_movie_url
          
  # # READ
  # get"/movies" => "movies#index"
  # get"/movies/:id" => "movies#show", as: :movie #movie_path()
  
  # # UPDATE
  # patch"/movies/:id" => "movies#update"
  # get"/movies/:id/edit" => "movies#edit", as: :edit_movie #edit_movie()
  
  # # DELETE
  # delete"/movies/:id" => "movies#destroy"

  #------------------------------
end