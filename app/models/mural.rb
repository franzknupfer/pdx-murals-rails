class Mural < ActiveRecord::Base

  validates :mural_name, :presence => true
  validates :year_created, :presence => true
  validates :artist_name, :presence => true
  validates :mural_address, :presence => true

  # def geo_address
  #   [:mural_address, "Portland,", "OR", "USA"].compact.join(', ')
  # end

  geocoded_by :mural_address
  after_validation :geocode
  # , if: ->(obj){ obj.address.present? and obj.address_changed? }

  # has_attached_file :attached_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # validates_attachment_content_type :attached_image, :content_type => /\Aimage\/.*\Z/
end
