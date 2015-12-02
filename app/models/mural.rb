class Mural < ActiveRecord::Base

  validates :mural_name, :presence => true
  validates :year_created, :presence => true
  validates :artist_name, :presence => true
  validates :mural_address, :presence => true
  validates :region, :presence => true
  validates :attached_image, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :attached_image

  def full_address
    "#{mural_address}, Portland, OR"
  end

  geocoded_by :full_address
  after_validation :geocode

  has_attached_file :attached_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :attached_image, :content_type => /\Aimage\/.*\Z/
end
