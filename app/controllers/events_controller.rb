class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    def new
      @event = Event.new
    end

    def show
        @event = Event.find(params[:id])
    end
    def edit
      @event = Event.find(params[:id])
    end

    def create
      @event = Event.new(event_params)
      if @event.save
        flash[:success] = " Your Gossip is here now !"
        redirect_to  events_path   
     end
    end
  
    private
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end
end
