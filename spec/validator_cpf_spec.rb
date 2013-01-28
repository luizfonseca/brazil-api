require 'spec_helper'
require 'validator'


describe Validator::Cpf do

  describe :valid? do
    it "should return false if the CPF is incorrect" do
      cpf = Validator::Cpf.new("123.123.123-111")
      expect(cpf.valid?).to eq(false)
    end

    it "should return true if the CPF is correct" do
      cpf = Validator::Cpf.new("111.111.111-11")
      expect(cpf.valid?).to eq(true)
    end
  end


  describe :as_json do
    it "should return an hash with cpf data" do
      cpf = Validator::Cpf.new("111.111.111-11")
      expect(cpf.as_json).to eq({cpf: { valid: true, value: cpf.cpf}})
    end
  end
end






