class EventsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @karaokes = Karaoke.all
  end
  
  def show
    @event = Event.find(params[:id])
  end

  def create
    event = Event.new(params_event)
    event.save
    redirect_to :action => :index
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id]).update_attributes(params_event)
    redirect_to :action => :index
  end

  def destroy
    event = Event.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_event
    params.require(:event).permit(
      :name, :karaoke_id, :date_of_issue
    )
  end
end
