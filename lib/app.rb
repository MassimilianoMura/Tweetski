require 'sinatra/base'
require 'data_mapper'
require_relative 'data_mapper_setup'
require_relative './models/peep'

class ChitterFeatures < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    'Hello ChitterFeatures!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
