class AttendeesController < ApplicationController

  def create
    @jamsession = Jamsession.find(params[:jamsession_id])
    @attendee = Attendee.new
    @attendee.user = current_user
    @attendee.jamsession_id = @jamsession.id

    if @attendee.save
      flash[:notice] = "You have successfully requested to join this jam session. Stand by for e-mail confirmation from #{@jamsession.user.nickname}."
      redirect_to jamsession_path(@jamsession)
    else
      render 'jamsessions/show'
    end
  end

  def update
    @jamsession = Jamsession.find(params[:jamsession_id])
    @attendee = Attendee.find_by(id: params[:id], jamsession_id: @jamsession.id)
    @attendee.approval = params[:query]
    if @attendee.save
      flash[:notice] = "Attendees updated."
      redirect_to jamsession_path(@jamsession)
    else
      render 'jamsessions/show'
    end
  end

  def destroy
    @jamsession = Jamsession.find(params[:jamsession_id])
    @approved_attendee = Attendee.find_by(user_id: current_user.id, approval: true)
    @approved_attendee.destroy
    flash[:notice] = "You have successfully left this jam session."
    redirect_to jamsession_path(@jamsession)
  end

end
