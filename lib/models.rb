class City < ActiveRecord::Base
	has_many :postcodes
	belongs_to :state
	belongs_to :country, through: :state
end

class Country < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many :states

	def add_state(name, abbr)
		states.find_or_create_by(:name => name, :abbr => abbr)
	end
end

class Postcode < ActiveRecord::Base
	validates :code, uniqueness: true
	belongs_to :city
end

class State < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many :cities
	belongs_to :country

	def add_city( name )
		cities.find_or_create_by(:name => name)
	end
end