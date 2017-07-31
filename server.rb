require 'sinatra'
require 'json'

require_relative 'examples/data/person'

set :port, 9494
set :public_folder, 'public'

get '/example/person' do
  content_type 'application/json'
  JSON.dump(Data::Person.generate)
end

get '/' do
  File.open('index.html').read
end

