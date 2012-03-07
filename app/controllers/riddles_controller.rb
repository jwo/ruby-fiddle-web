class RiddlesController < ApplicationController
  def index
    @riddle = Riddle.new
  end

  def create
    @riddle = Riddle.new(params[:riddle].slice(:code))
    @riddle_result = RiddleExec.new(Rails.configuration.ruby_fiddle_exec_url).execute(@riddle.code)
    render :index
  end
end
