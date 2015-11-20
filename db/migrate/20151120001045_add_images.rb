class AddImages < ActiveRecord::Migration
  def change
    add_attachment :murals, :attached_image
  end
end
