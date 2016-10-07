class KaraokesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @karaokes = Karaoke.all
  end

  def new
    @karaoke = Karaoke.new
  end
  
  def show
    @karaoke = Karaoke.find(params[:id])
  end

  def create
    karaoke = Karaoke.new(params_karaoke)
    karaoke.save
    redirect_to :action => :index
  end

  def edit
    @karaoke = Karaoke.find(params[:id])
  end

  def update
    karaoke = Karaoke.find(params[:id]).update_attributes(params_karaoke)
    redirect_to :action => :index
  end

  def destroy
    karaoke = Karaoke.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_karaoke
    params.require(:karaoke).permit(
      :name, :address, :phone
    )
  end
end
