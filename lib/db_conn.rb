require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql2',
  :database => 'test',
  :username => 'root',
  :password => 'frouds',
  :host     => 'localhost')