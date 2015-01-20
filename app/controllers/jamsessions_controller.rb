class JamsessionsController < ApplicationController
  include Geokit::Geocoders

  def index
    if params[:query]
      @jamsessions = Jamsession.search(params[:query])
    else
      @jamsessions = Jamsession.all
    end
    @jamsessions = @jamsessions.order('created_at DESC')
  end

  def show
    @jamsession = Jamsession.find(params[:id])
    @approved_attendees = Attendee.where(jamsession_id: params[:id], approval: true)
    @pending_attendees = Attendee.where(jamsession_id: params[:id], approval: false)
    @attendee = Attendee.new
    @approved_attendee = Attendee.find_by(user_id: current_user.id, approval: true)
    @coordinates = Jamsession.location(@jamsession)
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
    js_params = params.require(:jamsession).permit(:title, :description, :address, :city, :state, :zip_code, :date, :present_instrument, :desired_instruments, :latitude, :longitude)

    address = "#{params[:jamsession][:address]}, #{params[:jamsession][:city]}, #{params[:jamsession][:state]}"

    loc = MultiGeocoder.geocode(address)
    if loc.success == true
      js_params[:latitude] = loc.lat
      js_params[:longitude] = loc.lng
    end
  js_params
  end

end
