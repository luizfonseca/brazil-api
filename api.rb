require 'sinatra'
require 'slim'


get(%r{^(?!/api)}) { slim :index }

get '/api/:params' do
  
end









