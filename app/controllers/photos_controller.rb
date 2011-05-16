class PhotosController < InheritedResources::Base
  before_filter :generate_progress_key, :only => [:new, :edit, :create, :update]
  before_filter :authenticate_user!
  def index
    page = params[:page] || 1
    @photos = Photo.paginate(:page => page, :per_page => 20)
  end

  private

  def generate_progress_key
    @uuid = (0..29).to_a.map {|x| rand(10)}.join("")
  end
end
