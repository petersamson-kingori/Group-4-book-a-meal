class ApplicationController < ActionController::Base
    rescue_from StandardError, with: :standard_error
  
    def app_response(message: "success", status: 200, data: nil)
      render json: {
        message: message,
        data: data
      }, status: status
    end
  
    # Hash data into web token
    def encode(uid, email)
      payload = {
        data: {
          uid: uid,
          email: email
        },
        exp: 6.hours.from_now
      }
      JWT.encode(payload, ENV['food_stuff_key'], 'HS256')
    end
  
    # Unhash
    def decode(token)
      begin
        JWT.decode(token, ENV['food_stuff_key'], true, { algorithm: "HS256" })
      rescue JWT::DecodeError => e
        app_response(message: "failed", status: 401, data: { info: "your sesh has expired.log in again" })
      end
    end
  
    # Save a user
    def save_user(id)
      session[:uid] = id
      session[:expiry] = 6.hours.from_now
    end
  
    # Remove user
    def remove_user
      session.delete(:uid)
      session[:expiry] = Time.now
    end
  
    # Check session for expiry
    def session_expired?
      session[:expiry] || Time.now
      time_diff = (Time.parse(session[:expiry]) - Time.now).to_i
      unless time_diff > 0
        app_response(message: "failed", status: 401, data: { info: "your sesh has expired.log in again" })
      end
    end
  
    # Get user logged in
    def user
      User.find(session[:uid].to_i)
    end
  
    # Rescue all common errors
    def standard_error(exception)
      app_response(message: "failed", data: { info: exception.message }, status: :unprocessable_entity)
    end
  end
  