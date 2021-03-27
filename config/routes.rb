Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  defaults format: :json do
    post("/user_login", to: "login#verify_user")
    get("/get_labels", to: "labels#fetch_labels")
  end
end
