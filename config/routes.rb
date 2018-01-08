Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "certificates#index"
  resources :certificates do
    collection do
      get "/retrieve_courses_and_colleges_based_on_academic_program" => "certificates#retrieve_courses_and_colleges_based_on_academic_program"
      get "/retrieve_colleges_based_on_degree" => "certificates#retrieve_colleges_based_on_degree"
    end
  end
end
