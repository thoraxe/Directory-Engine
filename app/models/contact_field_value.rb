class ContactFieldValue < ActiveRecord::Base

  # each contact_field_value belongs to a contact, and simply holds
  # a string. this string will contain a value which will be cast into
  # the correct classtype (string, integer, decimal, etc)
  belongs_to :contact

  # the contact_field_value also corresponds to a particular contact_field
  # which we can refer back to in order to determine what our cast should
  # be
  belongs_to :contact_field

  # want a scope to find the value if we know the corresponding field id and 
  # contact id
  named_scope :find_value_from_field_and_contact, lambda { |field_id, contact_id| 
    { :conditions => { :contact_field_id => field_id, :contact_id => contact_id } }
  }

end
