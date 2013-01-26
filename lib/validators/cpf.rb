require 'br/cpf'

module Validator
  class Cpf
    attr_accessor :cpf

    def initialize(cpf)
      @cpf = Parser::Numeric.delete_non_numeric(cpf)
    end


    def as_json
      { cpf: { valid: valid?, value: @cpf } }
    end


    def valid?
      BR::CPF.valid? @cpf
    end
  end
end
