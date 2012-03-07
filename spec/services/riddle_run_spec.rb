require_relative "../../app/services/riddle_run"

describe RiddleRun do
  let(:input_hash) { {"output" => "0.2\n", "exception" => "StandardError", "result" => 0.2} } 

  subject { RiddleRun.new(input_hash) }
  its(:output) { should eq("0.2\n") }
  its(:exception) { should eq("StandardError") }
  its(:result) { should eq(0.2) }
end
