class RiddlesController < ApplicationController
  def index
    @riddle = Riddle.new
  end

  def create
    @riddle = Riddle.new(params[:riddle])
    @riddle.execute(@riddle.code)
    render :index
  end
end
