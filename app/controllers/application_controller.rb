class ApplicationController < ActionController::Base
  protect_from_forgery

  def Maybe(input)
    input.nil? ? NullObject.new : input
  end
end
