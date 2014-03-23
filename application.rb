require 'sinatra'
require 'sinatra/namespace'
require 'json'

Tilt.register Tilt::ERBTemplate, 'html.erb'
enable :logging

get '/' do
  erb :help
end

namespace '/api' do
  get { erb :help }

  get '/hello' do
    status 200
    content_type :json
    { text: "Hello World" }.to_json
  end

  get '/long' do
    status 200
    content_type :json
    sleep 2
    { text: "This was a long request" }.to_json
  end

  get '/error' do
    status 500
    content_type :json
    { error: "This was a test error" }.to_json
  end
end

not_found do
  status 404
  content_type :json
  { error: "Page is not found" }.to_json
end
