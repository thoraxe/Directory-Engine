class Contact < ActiveRecord::Base
  # geokit
  acts_as_mappable :auto_geocode => true
  before_update :geocode_address

  # every contact corresponds to a directory, which is really a user
  belongs_to :user

  # every contact may have extra field values associated with it
  # these fields were created by the user
  has_many :contact_field_values, :dependent => :destroy

  def address
    "#{self.address_1}, #{self.address_2}, #{self.city_town}, #{self.state_territory}, #{self.postal_code}, #{self.country}"
  end

  private
  def geocode_address
    geo = GeoKit::Geocoders::MultiGeocoder.geocode(self.address)
    errors.add(:addrtemp, "Could not geocode address") if !geo.success
    self.lat, self.lng = geo.lat, geo.lng if geo.success
  end

end
