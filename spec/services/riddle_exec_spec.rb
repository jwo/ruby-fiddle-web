require "vcr_helper"
require "spec_helper"

describe RiddleExec do
  subject { RiddleExec.new(Rails.configuration.ruby_fiddle_exec_url) }
  let(:the_code) { <<EOF
    puts 1/5.to_f
    5*10
EOF
  }
  let(:exceptional_code)  { <<EOF
    raise StandardError.new "stuffit"
EOF
  }
  it "should have the output set" do
    VCR.use_cassette('valid_set') do
      subject.execute(the_code).output.should eq("0.2\n")
    end
  end
  it "should have the result set" do
    VCR.use_cassette('valid_set') do
      subject.execute(the_code).result.should eq(50)
    end
  end
  it "should have the exception set" do
    VCR.use_cassette('exception_raised') do
      subject.execute(exceptional_code).exception.should eq("stuffit")
    end
  end
end
