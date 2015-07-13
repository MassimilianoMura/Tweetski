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
    peep = Peep.new(message: params[:message])
    tags = params[:tag].split(" ")

    tags.each do |tag|
      peep.tags <<  Tag.create(name: tag)
    end

    peep.save
    redirect to('/peeps')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @peeps = tag ? tag.peeps : []
    erb :'peeps/peeps'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
