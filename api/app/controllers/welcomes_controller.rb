class WelcomesController < ApplicationController

    def index
        render json: { message: 'Hello,world! This is our development branch' }
      end
      
end

