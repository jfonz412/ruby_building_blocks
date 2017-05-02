# I could probably combine most of 'invalid input' tests together
# Not sure if I am supposed to test all edge cases seperately

# Actually required extensive refactoring of my caesar_cipher
# Program is much improved from this!

require "caesar_cipher"

describe 'caesar_cipher' do

  context "given an empty string" do
    it "rejects input" do
  	  expect(caesar_cipher("",'5')).to eql(false)
  	end
  end

  context "spaces in our text" do
    it "rejects input" do
      expect(caesar_cipher("hello mom",'5')).to eql(false)
    end
  end

  context "given any numbers" do
    it "rejects the input" do
      expect(caesar_cipher("123hello", '5')).to eql(false)
    end
  end

  context "given any punctuation" do
    it "rejects the input" do
      expect(caesar_cipher("!hello!", '5')).to eql(false)
    end
  end

  context "captial letters in our text" do
    it "downcases all letters" do
      expect(caesar_cipher("XYZ",'3')).to eql("abc")
    end
  end
  
  context "we reach the end of the alphabet" do
    it "cycles back to 'ABC' ect." do
      expect(caesar_cipher("xyz", '3')).to eql("abc")
    end
  end

  context "user inputs letter as key" do
    it "rejects input" do
      expect(caesar_cipher("jim","a")).to eql(false)
    end
  end

  context "user inputs punctuation as/with key" do
    it "rejects input" do
      expect(caesar_cipher("jim","5!")).to eql(false)
    end
  end

  context "user inputs spaces or no key" do
    it "rejects input" do
      expect(caesar_cipher("jim"," ")).to eql(false)
    end
  end

end


