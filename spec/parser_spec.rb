require 'spec_helper'
require 'parser'

describe Parser do
  describe Numeric do
    
    describe ".delete_non_numeric" do

      context "with numeric values" do
        subject { Parser::Numeric.delete_non_numeric("My 123 string") }
        it "should remove non-numeric characters from given input" do
          expect(subject).to eq("123")
        end
      end

      context "without numeric values" do
        subject { Parser::Numeric.delete_non_numeric("My string") }
        it "should return an empty string if there ins't any numeric characters" do
          expect(subject).to eq("")
        end
      end


    end

  end
end
