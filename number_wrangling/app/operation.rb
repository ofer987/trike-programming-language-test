class Operation
  def initialize(operands, operators)
    @operands = Array(operands).map(&:to_i)
    @operators = Array(operators)
  end

  def to_s
    string_builder = ''
    @operators.each_with_index do |operator, index|
      operand = @operands[index]
      string_builder += "#{operand} #{operator} "
    end

    string_builder += @operands.last.to_s
  end
end
