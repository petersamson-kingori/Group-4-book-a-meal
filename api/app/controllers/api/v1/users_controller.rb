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

    def current_user
      render json: { user: UserSerializer.new(current_user) }, status: :ok
    end


      
    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  end