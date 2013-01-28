$LOAD_PATH << './lib'

require 'sinatra'
require 'sinatra/cross_origin'
require 'slim'

require 'response'
require 'validator'
require 'parser'



before do
  cache_control :public, :must_revalidate, :max_age => 100
end

get(%r{^(?!/api)}) { slim :index }

get '/api' do
  cross_origin
  content_type :json
  Response.data(params).to_json
end



