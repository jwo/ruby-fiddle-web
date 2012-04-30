class PlaysController < ApplicationController
  respond_to :js

  rescue_from RiddleExec::RiddleExecutionError, :with=> :error_riddle_result

  def run
    code = params[:riddle].fetch(:code)
    exec = RiddleExec.new(Rails.configuration.ruby_fiddle_exec_url)
    @riddle_result = exec.execute(code)
  end

  protected
    def error_riddle_result(exception)
      @execution_exception = exception
      render :run
    end
end
