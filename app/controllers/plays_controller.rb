class PlaysController < ApplicationController
  respond_to :js

  def run
    @riddle_result = RiddleExec.new(Rails.configuration.ruby_fiddle_exec_url).execute(params[:riddle].fetch(:code))
  end
end
