require 'sinatra'
require 'json'
require 'byebug'

require_relative 'examples/data/megaman'
require_relative 'examples/data/person'

set :port, 9494
set :public_folder, 'public'

get '/example/megaman' do
  content_type 'application/json'
  JSON.dump(Data::MegaMan.new.master(params[:master]))
end

get '/example/person' do
  content_type 'application/json'
  JSON.dump(Data::Person.generate)
end

get '/' do
  File.open('index.html').read
end

