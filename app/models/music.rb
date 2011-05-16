class Music < ActiveRecord::Base
  has_attached_file :music
  validates_attachment_presence :music
  validates_attachment_content_type :music, :content_type => ['audio/mid', 'audio/mpeg', 'audio/x-wav', 'audio/wav', 'video/mpeg', 'video/x-flv', 'video/mp4', 'video/mov', 'video/f4v'],
                                    :message => 'file is not be supported'

  validates_attachment_size :music, :less_than => 50.megabytes
  validates :title, :description, :presence => true
end
