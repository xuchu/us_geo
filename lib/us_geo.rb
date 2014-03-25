require './db_conn'
require './us_geo_models'

str = "99511,Anchorage,Alaska,AK"
arr = str.split(",")
postcode = arr[0]
city = arr[1]
state = arr[2]
state_abbr = arr[3]

@us = Country.create( :name => "US")
@state = @us.states.create(:name => state, :abbr => state_abbr)
@city = @state.cities.create(:name => city)
@postcode = @city.postcodes.create(:code => postcode)