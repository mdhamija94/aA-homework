class BandsController < ApplicationController
    def index
        # @band = Band.find_by(id: params[:id])
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find_by(id: params[:id])
        # redirect_to band_url(@band)
        render :show
    end

    def new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            redirect_to band_url(@band)
        else
            render json: Band.errors.full_messages
        end
    end

    def edit
        @band = Band.find_by(id: params[:id])
        render :edit
    end

    def update
        @band = Band.find_by(id: params[:id])
        
        if @band.update_attributes(band_params)
            redirect_to band_url(@band)
        else
            render json: 'error'
        end
    end

    def destroy
        @band = Band.find_by(id: params[:id])
        
        if @band.destroy
            redirect_to bands_url
        else
            render json: 'destroy failed'
        end
    end

    private

    def band_params
        params.require(:bands).permit(:name)
    end
end
