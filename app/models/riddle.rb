class Riddle < ActiveRecord::Base
  attr_reader :output, :exception, :result
  def execute(code)
    capture_stdout do 
      @result = capture_exceptions_eval(code)
    end
    @result
  end

  def capture_exceptions_eval(code)
    begin
      eval(code)
    rescue => exc
      @exception = exc
    rescue SyntaxError => se
      @exception = exc
    end
  end

  def capture_stdout
    s = StringIO.new
    $stdout = s
    result = yield
    @output = s.string
    result
  ensure
    $stdout = STDOUT
  end

end
