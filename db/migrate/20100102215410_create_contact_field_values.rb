class CreateContactFieldValues < ActiveRecord::Migration
  def self.up
    create_table :contact_field_values do |t|
      t.integer     :contact_id # the contact this field value belongs to
      t.integer     :contact_field_id # the contact field that we are a type of
      t.integer     :user_id # the user we belong to
      t.string      :field_value
      t.timestamps
    end
  end

  def self.down
    drop_table :contact_field_values
  end
end
