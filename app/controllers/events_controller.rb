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
        flash[:success] = " Your Event has been created"
        redirect_to  events_path   
     end
    end
    
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      flash[:success] = "Event deleted succesfully"
      redirect_to events_path
    end
  
    private
    def event_params
      params.require(:event).permit(:title, :location, :description, :start_date, :duration, :price)
    end
end


