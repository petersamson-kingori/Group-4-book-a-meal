class Api::V1::MenuOptionsController < ApplicationController
  before_action :set_caterer
  before_action :set_menu
  before_action :set_menu_option, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:create, :index]

  def index
    @menu_options = @menu.menu_options
    render json: @menu_options
  end

  def create
    # Find the day's menu based on the :day parameter
    @menu_for_day = @caterer.menus.find_by(name: menu_option_params[:day])
    unless @menu_for_day
      render json: { error: "Menu for the specified day does not exist" }, status: :unprocessable_entity
      return
    end
  
    # Build the menu option for the found menu
    @menu_option = @menu_for_day.menu_options.build(menu_option_params)
  
    if @menu_option.save
      render json: @menu_option, status: :created
    else
      render json: @menu_option.errors, status: :unprocessable_entity
    end
  end
  

  private

  def set_caterer
    @caterer = Caterer.find(params[:caterer_id])
  end

  def set_menu
    @menu = @caterer.menus.find(params[:menu_id])
  end

  def set_menu_option
    @menu_option = @menu.menu_options.find(params[:id])
  end

  def menu_option_params
    params.require(:menu_option).permit(:name, :description, :price, :day)
  end
end
