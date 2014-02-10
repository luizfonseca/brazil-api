$LOAD_PATH << './lib'

require 'sinatra'
require 'sinatra/base'
require 'sinatra/cross_origin'

require 'response'
require 'validator'
require 'parser'

configure { set :server, :puma }



before do
  cache_control :public, :must_revalidate, :max_age => 100
end

get(%r{^(?!/api)}) { erb :index }

get '/api' do
  cross_origin
  content_type :json
  Response.data(params).to_json
end



