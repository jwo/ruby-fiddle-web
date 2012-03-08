require "spec_helper"

describe Riddle do
  it {should validate_presence_of(:code)}

  context "#fork" do
    let(:code) { "5*50" }
    let!(:existing_riddle) { Riddle.create!(code: code)}
    it "should create a new instance, linked to the old" do
      new_riddle = existing_riddle.fork!
      new_riddle.riddle.should eq(existing_riddle)
    end
    it "should create a new instance, with the same code" do
      existing_riddle.fork!.code.should eq(code)
    end
  end

  context "generate tokens" do
    it "should generate a token on create" do
      riddle = Riddle.create(code: "1+2")
      riddle.public_token.should be_present
    end
  end

  context "#to_params" do
    it "should use the public token for to_param" do
      subject.stub(:public_token) { "551ab"}
      subject.to_param.should eq("551ab")
    end
  end
end
