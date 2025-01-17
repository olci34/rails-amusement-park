class AttractionsController < ApplicationController

    before_action :logged_in?
    before_action :set_attraction, only: [:show, :edit, :update]

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        attraction = Attraction.new(attraction_params)
        if attraction.save
            redirect_to attraction_path(attraction)
        else
            redirect_to new_attraction_path
        end
    end
    
    def show
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def edit
    end

    def update
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
    def set_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end

end