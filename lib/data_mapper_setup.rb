require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, "postgres://localhost/tweetski_#{env}")

require './lib/models/peep'
require './lib/models/tag'
require './lib/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!