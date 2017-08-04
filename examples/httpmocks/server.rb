require "sinatra"

get '/api/:name' do
  content_type 'plain/text'
  if File.exists?("files/#{params[:name]}")
    File.open("files/#{params[:name]}").read
  else
    status 404
  end
end
