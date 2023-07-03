class MenuOptionsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @menu = Menu.find(params[:menu_id])
        @menu_option = @menu.menu_options.build(menu_option_params)
    
        if @menu_option.save
          render json: @menu_option, status: :created
        else
          render json: @menu_option.errors, status: :unprocessable_entity
        end
      end
      private

      def menu_option_params
        params.require(:menu_option).permit(:name, :description, :price)
      end
end
