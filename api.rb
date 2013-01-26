$LOAD_PATH << './lib'

require 'sinatra'
require 'slim'

require 'response'
require 'validator'
require 'parser'


before do
  cache_control :public, :must_revalidate, :max_age => 100
end

get(%r{^(?!/api)}) { slim :index }

get '/api' do
  content_type :json
  Response.data(params).to_json
end



