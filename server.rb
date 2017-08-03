require 'sinatra'
require 'json'

require_relative 'examples/data/cpf_geneator'
require_relative 'examples/data/megaman'
require_relative 'examples/data/person'

set :port, 9494
set :public_folder, 'public'

get '/example/cpf' do
  content_type 'application/json'
  CPFGenerator.generate(params[:n].to_i, "public/cpf.csv")
  JSON.dump({status: 'ok'})
end

get '/example/output' do
  File.open('public/cpf.csv').read.gsub("\n", "<br/>")
end

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

