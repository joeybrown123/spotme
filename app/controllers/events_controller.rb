class EventsController < ApplicationController
  
  before_action :check_if_owner, only: [:edit, :update, :destroy]

  def check_if_owner
    event = Event.find(params[:id])
    if event.user_id != current_user.id
      redirect_to "/events", notice: "Cannot Edit/Delete other user information on the SpotMe Network"
    end
  end

  def index
    @events = Event.all
  end

  def show
   @event = Event.find(params[:id])

  end

  def show_user
    @user = User.find(params[:id])
    @user.name_first = params[:name_first]
 
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.workout_type = params[:workout_type]
    @event.duration_mins = params[:duration_mins]
    @event.date = params[:date]
    @event.user_id = params[:user_id]

    if @event.save
      redirect_to "/events", :notice => "Your workout was added correctly, way to go!"
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.workout_type = params[:workout_type]
    @event.duration_mins = params[:duration_mins]
    @event.date = params[:date]
    @event.user_id = params[:user_id]

    if @event.save
      redirect_to "/events", :notice => "Your Workout was just updated"
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    redirect_to "/events", :notice => "Workout was deleted."
  end
end
