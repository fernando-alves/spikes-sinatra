require 'sinatra'
require 'open-uri'
require 'trakt'
require 'net/http'
require 'json'
require 'uri'

get '/' do
  'Hello World'
end

get '/about' do
  'A little about me'
end

get '/hello/*' do
  params[:splat]
end

get '/form' do
  erb :form

end

get '/trakt' do
  erb :trakt
end

post '/trakt' do
  series_list(params[:username], params[:api_key])
end

def series_list(username, api_key)
 req = Net::HTTP.get( URI("http://api.trakt.tv/user/calendar/shows.json/#{api_key}/#{username}"))
 req.to_s
end

post '/form' do
  file_path = params[:torrent]
  remote_data = open(file_path).read
  local_file = open('./torrent_test', 'w')
  local_file.write(remote_data)
  local_file.close
end
