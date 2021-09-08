class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  
  acts_as_token_authentication_handler_for User
end
