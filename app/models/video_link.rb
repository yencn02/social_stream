class VideoLink < ActiveRecord::Base
  validates :title, :description, :link, :embed, :presence => true
end

