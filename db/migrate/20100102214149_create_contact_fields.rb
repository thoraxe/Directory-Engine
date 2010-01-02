class CreateContactFields < ActiveRecord::Migration
  def self.up
    create_table :contact_fields do |t|
      t.string    :name # the name of the field being added
      t.string    :field_type # the type of the field being added (boolean, integer, whatever)
      t.integer   :user_id # the id of the user who created this field
      t.timestamps
    end
  end

  def self.down
    drop_table :contact_fields
  end
end
