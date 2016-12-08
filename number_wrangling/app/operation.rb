class Operation
  OPERATORS = [:+, :-, :*, :/].freeze

  class << self
  end

  def operations(operands, attempts)
    operands = Array(operands)

    operands

    symbols = get_symbols

    symbols.each_with_index do |symbol, index|
      results = []
      case symbol
      when :+
      when :-
      when :*
        results << index
      when :/
        results << index
      end
    end
  end

  def decision(first_indices)
    first_indices.each do |index|
      left = operands[index]
      right = operands[index + 1]

      # construct operation
      # check memo for operation (internal to Operation)
      # return result

      # operands
      operators = operators[0..index-1] + operators[index+1..-1]

      operands = operands[0..index-1] + [result] + [index+1..-1]

      next_operation
      
    end
  end

  def calculate(left, right, operator)
    result = case operator
             when :+
               left + right
             when :-
               left - right
             when :*
               left * right
             when :/
               left / right
             else
               raise 'wrong operator'
             end
  end

  private

  def increment_counter
    @counter = 0 if @counter.nil?

    @counter += 1
  end

  def get_symbols
    results = []
    increment_counter

    remaining = @counter
    while remaining > 0
      digit = remaining % OPERATORS.length

      results << OPERATORS[digit]
      remaining -= digit
    end

    required_operands_count = operands.length - 1

    results[0..operands.length-1]

    remaining_length = results.length - required_operands_count
    if remaining_length > 0
      results + remaining_length.times.map { OPERATORS.first }
    end
    results
  end
end
