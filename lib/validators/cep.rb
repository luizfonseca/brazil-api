require 'net/http'
require 'uri'
require 'json'

module Validator
  class Cep

    attr_accessor :cep

    def initialize(cep)
      @cep = Parser::Numeric.delete_non_numeric(cep)
    end

    def as_json
      { cep: { valid: valid? }.merge(result) }
    end


    def result 
      valid? ? JSON.parse(response_body) : {}
    end

    def response_body
      Net::HTTP.get_response(request_uri).body
    end

    def valid?
      @cep.length == 8
    end


    def request_uri
      URI.parse("http://cep.s1mp.net/#{@cep}")
    end
  end
end
