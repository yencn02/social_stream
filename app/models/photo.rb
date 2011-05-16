require 'RMagick'

class Photo < ActiveRecord::Base
 	has_attached_file :photo,
                    :styles => { :thumb => '90>x60', :medium => '180>x120', :large => '200>x133' },
                    :default_url => "/images/photo/:style/:subtype_class.png"
  validates :title, :description, :presence => true
end

