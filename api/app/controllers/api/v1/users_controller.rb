class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end
  

    def create
      @user = User.create(user_params)
      if @user.save
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def index
        users = User.all
        render json: { users: users }, status: :ok
    end

    def show
      user = User.find(params[:id])
      render json: { user: UserSerializer.new(user) }, status: :ok
    end

    #def current_user
      #user_id = decode_token(request.headers['Authorization']) # Replace with your JWT decoding logic
      #@current_user ||= User.find(user_id)
    #end

      
    private

    
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def decode_token(token)
      # Implement your JWT decoding logic to retrieve the user ID from the token
      # This is just a placeholder, you need to replace it with your actual decoding logic
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
      decoded_token.first['user_id']
    rescue JWT::DecodeError
      nil
    end
  end