class User < ActiveRecord::Base
  include Clearance::User

  # each "user" is a different directory in the context of this application
  # every directory will have many contacts associated with it, and each
  # contact will have many elements above and beyond the standard address-y stuff

  has_many :contacts, :dependent => :destroy

  # a user may extend their directory by adding additional fields
  # a field may have a name and then a type is selected
  has_many :contact_fields, :dependent => :destroy

end
