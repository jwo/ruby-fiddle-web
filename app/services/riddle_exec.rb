require 'net/http'
require "active_support/all"
class RiddleExec
  class RiddleExecutionError < StandardError; end

  def initialize(base_url)
    @base_url = base_url
  end
  def execute(code)
    begin
      transform_to_hash(httpize(code))
    rescue => exc
      raise RiddleExecutionError.new exc 
    end
  end

  def transform_to_hash(result)
    json = ActiveSupport::JSON.decode(result)
    RiddleRun.new(json)
  end

  def httpize(code)
    uri = URI(@base_url)
    Net::HTTP.post_form(uri, 'code' => code).body
  end
end
