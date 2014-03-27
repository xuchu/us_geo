require "./db_conn"

class City < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.belongs_to :state
    end
  end
end

class Postcode < ActiveRecord::Migration
  def change
    create_table :postcodes do |t|
      t.integer :code
      t.belongs_to :city
    end
  end
end

class State < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbr
      t.belongs_to :country
    end
  end
end

class Country < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
    end
  end
end

City.new.migrate(:up)
Postcode.new.migrate(:up)
State.new.migrate(:up)
Country.new.migrate(:up)