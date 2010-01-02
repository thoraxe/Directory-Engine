class ContactField < ActiveRecord::Base

  # contact fields may be created by the user to extend their own
  # directory. a contact field has a name and a type, like
  # string, integer, etc, which determines what form should be 
  # presented to the user upon editing
  belongs_to :user

end
