class MuralsTable < ActiveRecord::Migration
  def change
    create_table :murals do |t|
      t.column :mural_name, :string
      t.column :year_created, :string
      t.column :artist_name, :string
      t.column :artist_name2, :string
      t.column :artist_name3, :string
      t.column :mural_address, :string
      t.column :photo_credit, :string

      t.timestamps
    end
  end
end
