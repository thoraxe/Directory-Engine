class ContactField < ActiveRecord::Base

  # contact fields may be created by the user to extend their own
  # directory. a contact field has a name and a type, like
  # string, integer, etc, which determines what form should be 
  # presented to the user upon editing
  belongs_to :user

  # each contact field that a user creates will have lots of entries
  # for values, which correspond to contacts, too
  has_many :contact_field_values, :dependent => :destroy
end
