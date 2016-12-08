class Parser
  OPERATORS = [:+, :-, :*, :/].freeze

  def initialize(operands)
    @operands = Array(operands)
  end

  def run
    sets = execute

    sets.each do |set|
      left = nil
      set
        .sort_by { |x, y| y.operator <=> x.operator }
        .each do |x|
          left ||= x.left
          left = x.execute(left)
        end
    end
  end

  def execute
    operation_count = operands.length - 1

    operations = []
    OperatorArray.new(operation_count).each do |operators|
      build_operations(operators)[0].to_i
      #
      # operations << build_operations(operators)
    end
    #
    # operations
  end

  private

  def build_operations(operators, operands)
    operations = []

    left = operands[0]
    operators.each_with_index do |operator, index|
      next if next_operator.nil?

      next_operator = operators[index+1]
      right = operands[index+1]

      operation = if next_operator > operator
                    Operation.new(next_operation, right, operator)
                  else
                    Operation.new(left, right, operator)
                  end
      operations << operation

      left = operation
    end

    operations
  end

  def next_operation(operators, operands)
    operations = []

    left = operands[0]
    operation = Operation.new
    operators.each_with_index do |operator, index|
      next if next_operator.nil?
      next_operation = Operation.new

      next_operator = operators[index+1]
      right = operands[index+1]

      operation = if next_operator > operator
                    Operation.new(left, next_operation, operator)
                  else
                    Operation.new(left, right, operator)
                  end
      operations << operation

      left = operation
      operation = next_operation
    end

    operations
  end

  def get_operator(operators, remaining)
    if remaining > 0
      OPERATORS.each do |operator|
        return
      end
      get_operator
    end
end
