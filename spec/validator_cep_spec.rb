require 'spec_helper'
require 'validator'


describe Validator::Cep do

  before do
    @cep          = Validator::Cep.new("78132-500")
    @cep_invalid  = Validator::Cep.new("78132-5000")
    @body         = { rua: "", bairro: "", logradouro: ""}
    @http_mock    = mock("Net::HTTPResponse")
    @http_mock.stub(code: 200, message: :OK, content_type: "application/json", body: @body )
  end


  describe :valid? do
    it "should return true if the input is a valid email" do 
      expect(@cep.valid?).to eq(true)
    end

    it "should return false if the input isn't a valid email" do
      expect(@cep_invalid.valid?).to eq(false)
    end
  end


  describe :response_body do
    it "should make a request to the CEP provider and return its body" do
      Net::HTTP.stub(:get_response).with(any_args).and_return(@http_mock)
      expect(@cep.response_body).to eq(@body)
    end
  end


  describe :result do
    it "should return nil if the cep is invalid" do
      expect(@cep_invalid.result).to eq(nil) 
    end

    it "should return an hash with cep data if cep is valid" do
      @cep.stub(:response_body).and_return("{ \"result\": \"true\" }") 
      expect(@cep.result).to eq({"result" => "true"})
    end
  end


  describe :as_json do
    it "should return an hash info about the cep that was informed" do
      @cep.stub(:response_body).and_return("{ \"result\": \"true\" }") 
      expect(@cep.as_json).to eq({ cep: { valid: true, "result" => "true" } } )
    end
  end

end







