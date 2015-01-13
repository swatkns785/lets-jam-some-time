class JamsessionsController < ApplicationController

  def index
    @jamsessions = Jamsession.all
    @jamsessions = @jamsessions.order('created_at DESC')
  end

  def show
    @jamsession = Jamsession.find(params[:id])
  end

  def new
    @jamsession = Jamsession.new
  end

  def create
    @jamsession = Jamsession.new(jamsession_params)
    @jamsession.user = current_user

    if @jamsession.save
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

  private

  def jamsession_params
    params.require(:jamsession).permit(:title, :description, :location, :date, :present_instrument, :desired_instruments)
  end

end
