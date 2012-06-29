class Voter < ActiveRecord::Base
  attr_accessible :voter_name, :street_address, :city, :state, :zipcode, :email, :phone, :lat, :lng, :gmaps
  
  acts_as_gmappable :lat => "lat", :lng => "lng"
  # build an address from street, city, and state attributes
  geocoded_by :gmaps4rails_address

  # store the fetched address in the full_address attribute
  reverse_geocoded_by :lat, :lng, :address => :gmaps4rails_address

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street_address}, #{self.city}, #{self.state}, #{self.zipcode}" 
  end
end
