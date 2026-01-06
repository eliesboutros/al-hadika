Rails.application.routes.draw do
  # Set home as root page
  root "pages#home"

  # Define routes for other pages
  get "about", to: "pages#about"
  get "services", to: "pages#services"
  get "reviews", to: "pages#reviews"
  get "contact", to: "pages#contact"
  post "contact", to: "pages#create_contact"
end
