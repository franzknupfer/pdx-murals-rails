class Addregion < ActiveRecord::Migration
  def change
    add_column :murals, :region, :string
    remove_column :murals, :artist_name2, :string
    remove_column :murals, :artist_name3, :string
  end
end
