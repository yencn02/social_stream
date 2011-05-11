class PhotosController < InheritedResources::Base

  before_filter :authenticate_user!
  def index
    
  end

  def create
    @avatar = Photo.create(params[:photo])
    @avatar.save
    redirect_to photos_path
  end
end
