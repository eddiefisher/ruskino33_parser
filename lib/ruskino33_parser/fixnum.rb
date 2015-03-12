class Fixnum
  def day
    self * (60 * 60 * 24) # seconds * hours * minutes
  end

  def ago
    Time.now - self
  end
end
