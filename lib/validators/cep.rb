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
      json = {}

      if valid?
        body = JSON.parse(response_body)
        log  = body['logradouro'].split(' ')

        json = { 
          data: {
            cidade: body['localidade'],
            uf: body['uf'],
            bairro: body['bairro'],
            tp_logradouro: log.shift,
            logradouro: log.join(' '),
            cep: @cep
          }
        }
      end

      return json
    end

    def response_body
      Net::HTTP.get_response(request_uri).body
    end

    def valid?
      @cep.length == 8
    end


    def request_uri
      URI.parse("http://cep.correiocontrol.com.br/#{@cep}.json")
    end
  end
end
