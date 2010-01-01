class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city_town
      t.string :state_territory
      t.string :postal_code
      t.string :country

      # for geokit
      t.float :lat
      t.float :lng
      t.timestamps

      # every contact belongs to a user
      t.integer :user_id

    end
  end

  def self.down
    drop_table :contacts
  end
end
