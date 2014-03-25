require './us_geo_db'

class City < ActiveRecord::Base
	has_many :postcodes
	belongs_to :state
end

class Country < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many :states
end

class Postcode < ActiveRecord::Base
	validates :code, uniqueness: true
	belongs_to :city
end

class State < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many :cities
	belongs_to :country

	def add_city(city_name)
		if city = cities.find_by_name(city_name)
			return city
		else
			create_city(name: :city_name)
		end
	end
end