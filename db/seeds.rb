foo = User.create(:email => "erikmjacobs@gmail.com", :password => "goober", :password_confirmation => "goober")
foo.confirm_email!

