require 'sinatra'
require 'open-uri'

get '/' do
  'Hello, world!'
end

get '/about' do
  'A little about me'
end

get '/hello/*'do
  params[:splat]
end

get '/form' do
  erb :form

end

post '/form' do
  file_path = params[:torrent]
  remote_data = open(file_path).read
  local_file = open('./torrent_test', 'w')
  local_file.write(remote_data)
  local_file.close
end
