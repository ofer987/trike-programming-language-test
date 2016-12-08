class Nil::Operator
  def nil?
    true
  end

  def <=>(other)
    false
  end
end
