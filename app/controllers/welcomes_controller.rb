class WelcomesController < ApplicationController

    def index
        render json: { message: 'Hello, index world!' }
      end
      
    def hello_world
        render json: { message: 'Hello, world!' }
      end
end

