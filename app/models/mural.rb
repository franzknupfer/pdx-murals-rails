class Mural < ActiveRecord::Base
  validates :mural_name, :presence => true
  validates :year_created, :presence => true
  validates :artist_name, :presence => true
  validates :mural_address, :presence => true

  # has_attached_file :attached_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # validates_attachment_content_type :attached_image, :content_type => /\Aimage\/.*\Z/
end
