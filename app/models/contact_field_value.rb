class ContactFieldValue < ActiveRecord::Base

  # each contact_field_value belongs to a contact, and simply holds
  # a string. this string will contain a value which will be cast into
  # the correct classtype (string, integer, decimal, etc)
  belongs_to :contact

  # the contact_field_value also corresponds to a particular contact_field
  # which we can refer back to in order to determine what our cast should
  # be
  belongs_to :contact_field
end
