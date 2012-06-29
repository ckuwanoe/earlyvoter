class Voter < ActiveRecord::Base
  attr_accessible :voter_name, :street_address, :city, :state, :zipcode, :email, :phone, :lat, :lng, :gmaps
  
  acts_as_gmappable :lat => "lat", :lng => "lng"
  # build an address from street, city, and state attributes
  geocoded_by :gmaps4rails_address

  # store the fetched address in the full_address attribute
  reverse_geocoded_by :lat, :lng, :address => :gmaps4rails_address

  validates :voter_name, :presence => true
  validates :street_address, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true
  validates :zipcode, :presence => true
  validates :email, :presence => true
  validates :phone, :presence => true

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.street_address}, #{self.city}, #{self.state}, #{self.zipcode}" 
  end
  
  def gmaps4rails_marker_picture
    {
     "picture" => "http://media.roryreid.com.s3.amazonaws.com/house-image.png",
     "width" => 32,
     "height" => 32,
     "marker_anchor" => [ 5, 10],
     "shadow_picture" => "/images/morgan.png" ,
     "shadow_width" => "110",
     "shadow_height" => "110",
     "shadow_anchor" => [5, 10],
    }
  end
  
  def gmaps4rails_infowindow
      "You are here:<br>#{self.street_address}<br>#{self.city}, #{self.state} #{self.zipcode}"
  end
end
