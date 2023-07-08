class Api::V1::UserMenuOptionsController < ApplicationController
    def index
        @menu_options = Menu.all
        render json: @menu_options
      end
      
end
