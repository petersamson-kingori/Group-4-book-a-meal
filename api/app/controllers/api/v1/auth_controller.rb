class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create, :create_caterer]
  
    def create
      @user = User.find_by(username: user_login_params[:username])
      #User#authenticate comes from BCrypt
      if @user && @user.authenticate(user_login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end

    def create_caterer
      @caterer = Caterer.find_by(username: caterer_login_params[:username])
      # Caterer#authenticate comes from BCrypt
      if @caterer && @caterer.authenticate(caterer_login_params[:password])
        # encode token comes from ApplicationController
        token = encode_token({ caterer_id: @caterer.id })
        render json: { caterer: CatererSerializer.new(@caterer), jwt: token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end

    def destroy
      if current_user.destroy
        render json: { message: 'User deleted successfully' }, status: :ok
      else
        render json: { error: 'Failed to delete user' }, status: :unprocessable_entity
      end
    end

    def destroy_caterer
      if current_caterer.destroy
        render json: { message: 'Caterer deleted successfully' }, status: :ok
      else
        render json: { error: 'Failed to delete caterer' }, status: :unprocessable_entity
      end
    end
  
    private

    def caterer_login_params
      # params { caterer: {username: 'Caterer1', password: 'password' } }
      params.require(:caterer).permit(:username, :password)
    end
  
    def user_login_params
      # params { user: {username: 'Chandler Bing', password: 'hi' } }
      params.require(:user).permit(:username, :password)
    end
  end