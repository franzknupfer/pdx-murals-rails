class Mural < ActiveRecord::Base

  validates :mural_name, :presence => true
  validates :year_created, :presence => true
  validates :artist_name, :presence => true
  validates :mural_address, :presence => true
  validates :region, :presence => true
  validates :attached_image, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :attached_image
  before_save :portland_address

  def portland_address
    if (self.latitude < 45.433318) || (self.latitude > 45.651172) || (self.longitude < -122.836649) || (self.longitude > -122.472813)
      errors.add(:mural_address, "This is not a valid Portland address. Please enter a Portland address.")
      false
    else
      true
    end
  end

  geocoded_by :mural_address
  after_validation :geocode

  has_attached_file :attached_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :attached_image, :content_type => /\Aimage\/.*\Z/
end
