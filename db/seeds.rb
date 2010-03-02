erik = User.create(:email => "erikmjacobs@gmail.com", :password => "goober", :password_confirmation => "goober")
erik.confirm_email!

#contact = Contact.new(:name => "Fairhope Stable", 
#                      :address_1 => "2755 Bunten Road", 
#                      :address_2 => "Suite 1200",
#                      :city_town => "Atlanta", 
#                      :state_territory => "GA", 
#                      :postal_code => "30326", 
#                      :country => "USA")

contact = Contact.new(:name => "Fairhope Stable", 
                      :address_1 => "2755 Bunten Road", 
                      :city_town => "Duluth", 
                      :state_territory => "GA", 
                      :postal_code => "30096", 
                      :country => "USA")
erik.contacts << contact

contact = Contact.new(:name => "Little Creek Farm", 
                      :address_1 => "2057 Lawrenceville Highway", 
                      :city_town => "Decatur", 
                      :state_territory => "GA", 
                      :postal_code => "30033", 
                      :country => "USA")
erik.contacts << contact

contact = Contact.new(:name => "Rose Ridge Farm", 
                      :address_1 => "5295 Morton Road", 
                      :city_town => "Alpharetta", 
                      :state_territory => "GA", 
                      :postal_code => "30022", 
                      :country => "USA")
erik.contacts << contact

contact = Contact.new(:name => "Parkwood Farms Therapy Center", 
                      :address_1 => "2519 Parkwood Road", 
                      :city_town => "Snellville", 
                      :state_territory => "GA", 
                      :postal_code => "30039", 
                      :country => "USA")
erik.contacts << contact

contact = Contact.new(:name => "Willow South Riding School", 
                      :address_1 => "10290 Old Woodland Entry", 
                      :city_town => "Alpharetta", 
                      :state_territory => "GA", 
                      :postal_code => "30022", 
                      :country => "USA")
erik.contacts << contact

contact = Contact.new(:name => "Vogt Riding Academy", 
                      :address_1 => "1064 Houston Mill Road NE", 
                      :city_town => "Atlanta", 
                      :state_territory => "GA", 
                      :postal_code => "30329", 
                      :country => "USA")
erik.contacts << contact

contact = Contact.new(:name => "Dream Quest E.F.P", 
                      :address_1 => "1424 Oak Bend Way", 
                      :city_town => "Lawrenceville", 
                      :state_territory => "GA", 
                      :postal_code => "30045", 
                      :country => "USA")
erik.contacts << contact

contact = Contact.new(:name => "BENTmallet Farms", 
                      :address_1 => "4095 Big Creek Overlook", 
                      :city_town => "Alpharetta", 
                      :state_territory => "GA", 
                      :postal_code => "30005", 
                      :country => "USA")
erik.contacts << contact

