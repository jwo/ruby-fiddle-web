require 'net/http'
require "active_support/all"
class RiddleExec

  def initialize(base_url)
    @base_url = base_url
  end
  def execute(code)
    transform_to_hash(httpize(code))
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
