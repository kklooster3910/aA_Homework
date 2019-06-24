class BandsController < ApplicationController
    
    def index
        @bands = Band.all
        render :index
    end

    def new
        @band = Band.new 
        render :new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            flash[:success] = "Congrats on creating a new band!"
            redirect_to bands_url
        else
            flash[:fail] = "Please check your band name"
            render :new
        end
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end

end