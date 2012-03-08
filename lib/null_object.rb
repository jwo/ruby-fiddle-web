class NullObject
  def method_missing(*args)
    self
  end
  def nil?
    true
  end
end
