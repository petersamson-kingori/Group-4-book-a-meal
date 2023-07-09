class Api::V1::UserMenuOptionsController < ApplicationController
  skip_before_action :authorized, only: [:index]
    def index
        @menu_options = Menu.all
        render json: @menu_options
      end
      
end
