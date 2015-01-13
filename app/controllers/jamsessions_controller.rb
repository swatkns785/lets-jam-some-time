class JamsessionsController < ApplicationController

  def index
    @jamsessions = Jamsession.all
    @jamsessions = @jamsessions.order('created_at DESC')
  end

  def show
    @jamsession = Jamsession.find(params[:id])
    @approved_attendee = Attendee.find_by(user_id: current_user.id, jamsession_id: params[:id], approval: true)
    @attendee = Attendee.new
  end

  def new
    @jamsession = Jamsession.new
  end

  def create
    @jamsession = Jamsession.new(jamsession_params)
    @jamsession.user = current_user

    if @jamsession.save
      @creator_attendee = Attendee.new(user_id: current_user.id, jamsession_id: Jamsession.last.id, approval: true)
      @creator_attendee.save
      flash[:notice] = "Your jam session has been successfully created."
      redirect_to jamsession_path(@jamsession)
    else
      render :new
    end
  end

  def edit
    @jamsession = Jamsession.find(params[:id])
  end

  def update
    @jamsession = Jamsession.find(params[:id])

    if @jamsession.update(jamsession_params)
      flash[:notice] = "Your jam session has been successfully updated."
      redirect_to jamsession_path(@jamsession)
    else
      render :edit
    end
  end

  def destroy
    @jamsession = Jamsession.find(params[:id])
    @jamsession.destroy
    flash[:notice] = "Your jam session has been successfully deleted."
    redirect_to root_path
  end

  private

  def jamsession_params
    params.require(:jamsession).permit(:title, :description, :location, :date, :present_instrument, :desired_instruments)
  end

end
