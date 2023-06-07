class WelcomesController < ApplicationController

    def index
        render json: { message: 'Hello, index world! This is the main/presentation branch' }
      end
    
end

