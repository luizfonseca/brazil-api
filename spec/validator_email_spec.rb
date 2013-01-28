require 'spec_helper'
require 'validator'


describe Validator::Email do

  describe :valid? do
    it "should return true if the input is a valid email" do
      email = Validator::Email.new("valid@email.com")
      expect(email.valid?).to eq(true)
    end

    it "should return false if the input isn't a valid email" do
      email = Validator::Email.new("invalid@email.")
      expect(email.valid?).to eq(false)
    end
  end
  

  describe :as_json do
    
    it "should return an hash with some metadata for the given email" do
      email = Validator::Email.new("valid@email.com")
      expect(email.as_json).to eq({email: { valid: true, value: "valid@email.com"}})
    end
  end

end






