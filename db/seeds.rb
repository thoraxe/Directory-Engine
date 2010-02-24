foo = User.create(:email => "erikmjacobs@gmail.com", :password => "goober", :password_confirmation => "goober")
foo.confirm_email!

contact1 = Contact.new(:name => "Red Hat", :address_1 => "3340 Peachtree Rd NE", :address_2 => "Suite 1200",
                       :city_town => "Atlanta", :state_territory => "GA", :postal_code => "30326", :country => "USA")
foo.contacts << contact1

contact2 = Contact.new(:name => "Erik's House", :address_1 => "5999 Rotondo Pl", 
                       :city_town => "Norcross", :state_territory => "GA", :postal_code => "30093", :country => "USA")
foo.contacts << contact2
