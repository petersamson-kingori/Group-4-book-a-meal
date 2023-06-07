class WelcomesController < ApplicationController

    def index
        render json: { message: 'Hello, index world! This is our development branch' }
      end
      
end

