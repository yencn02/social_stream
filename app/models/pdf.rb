class Pdf < ActiveRecord::Base
  has_attached_file :pdf
  validates_attachment_presence :pdf
  validates_attachment_content_type :pdf, :content_type => ['application/pdf'],
                                    :message => 'file is not be supported'

  validates_attachment_size :pdf, :less_than => 50.megabytes
  validates :title, :description, :presence => true
end
