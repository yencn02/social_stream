class Doc < ActiveRecord::Base
  has_attached_file :doc
  validates_attachment_presence :doc
  validates_attachment_content_type :doc, :content_type => ['application/octet-stream', 'application/msword', 'application/vnd.oasis.opendocument.text', 'application/vnd.oasis.opendocument.spreadsheet'],
                                    :message => 'file is not be supported'

  validates_attachment_size :doc, :less_than => 50.megabytes
  validates :title, :description, :presence => true
end
