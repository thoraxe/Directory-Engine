class CreateContactFieldValues < ActiveRecord::Migration
  def self.up
    create_table :contact_field_values do |t|
      t.integer     :contact_id # the contact this field value belongs to
      t.string      :field_value
      t.timestamps
    end
  end

  def self.down
    drop_table :contact_field_values
  end
end
