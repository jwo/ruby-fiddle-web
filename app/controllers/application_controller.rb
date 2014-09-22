class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def Maybe(input)
    input.nil? ? NullObject.new : input
  end
end
