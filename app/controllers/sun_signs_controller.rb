class SunSignsController < ApplicationController

    def index 
        @sun_signs = SunSign.all 
    end 

    def show 
        @sun_sign = SunSign.find(params[:id])
    end 

end 