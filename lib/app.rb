require 'sinatra/base'
require 'data_mapper'
require_relative 'data_mapper_setup'
require_relative './models/peep'

class ChitterFeatures < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect to('/peeps')
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
