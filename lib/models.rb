class City < ActiveRecord::Base
	has_many :postcodes
	belongs_to :state
end

class Country < ActiveRecord::Base
	validates :name, uniqueness: true
	has_many :states

	def add_state( name, abbr )
		if state = states.find_by_name(name)
			return state
		else
			state = states.build(:name => name, :abbr => abbr)
		end
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

end