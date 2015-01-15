class TracksController < ApplicationController

  def new
    @track = Track.new
  end

  def create
    @track = Track.upload_to_soundcloud(track_params, current_user)

    flash[:notice] = "Your file is currently being processed by Soundcloud. It will be available shortly."
    redirect_to root_path
  end

  private

  def track_params
    params.require(:track).permit(:track_title, :song_file)
  end

end
