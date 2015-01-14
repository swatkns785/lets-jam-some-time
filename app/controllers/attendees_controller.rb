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

end
