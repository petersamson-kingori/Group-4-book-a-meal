class Api::V1::CaterersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { caterer: CatererSerializer.new(current_caterer) }, status: :accepted
  end

  def create
    @caterer = Caterer.create(caterer_params)
    if @caterer.save
      @token = encode_token({ caterer_id: @caterer.id })
      render json: { caterer: CatererSerializer.new(@caterer), jwt: @token }, status: :created
    else
      render json: { errors: @caterer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    caterers = Caterer.all
    render json: { caterers: caterers }, status: :ok
  end

  def show
    caterer = Caterer.find(params[:id])
    render json: { caterer: CatererSerializer.new(caterer) }, status: :ok
  end

  private

  #def current_caterer
    #caterer_id = decode_token(request.headers['Authorization']) # Replace with your JWT decoding logic
    #@current_caterer ||= Caterer.find(caterer_id)
  #end

  def caterer_params
    params.require(:caterer).permit(:username, :business_name, :email, :password, :password_confirmation)
  end

  def decode_token(token)
    # Implement your JWT decoding logic to retrieve the caterer ID from the token
    # This is just a placeholder, you need to replace it with your actual decoding logic
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
    decoded_token.first['caterer_id']
  rescue JWT::DecodeError
    nil
  end
end
