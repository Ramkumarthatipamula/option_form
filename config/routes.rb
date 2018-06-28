Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "certificates#home_page"
  resources :certificates do
    collection do
      get "/retrieve_courses_and_colleges_based_on_academic_program" => "certificates#retrieve_courses_and_colleges_based_on_academic_program"
      get "/retrieve_colleges_based_on_degree" => "certificates#retrieve_colleges_based_on_degree"
      get "/get_certificates_data" => "certificates#get_certificates_data"
      get "/alloatment_form" => "certificates#alloatment_form"
      get "/alloatment_index1" => "certificates#alloatment_index1"
    end
  end
  post "/executer_route" => "certificates#executer_route"
end
