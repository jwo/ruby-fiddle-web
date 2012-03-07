require "active_support/all"
class RiddleRun
  attr_reader :output, :result, :exception
  def initialize(input_hash={})
    hash = HashWithIndifferentAccess.new(input_hash)
    @output = hash.fetch(:output)
    @result = hash.fetch(:result)
    @exception = hash.fetch(:exception)
  end
end
