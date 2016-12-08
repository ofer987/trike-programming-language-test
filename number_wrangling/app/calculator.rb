class Calculator
  def initialize(operands, expected_total, attempts)
    @operands = Array(operands).map(&:to_i)
    @expected_total = expected_total.to_i
    @attempts = attempts.to_i
  end

  def results
    return @result if @results

    @results = []
    operation_count = @operands.length - 1

    attempted = 0
    OperatorArray.new(operation_count).each do |operators|
      attempted += 1
      break if attempted > @attempts

      operation = Operation.new(@operands, operators).to_s

      # Should be in a begin-resuce block because
      # of the eval statement
      begin
        total = eval(operation)

        result = Result.new(operation, total, @expected_total)
        @results << result

        break if result.expected?
      rescue ZeroDivisionError => exception
        logger.warn(exception)
      rescue => exception
        logger.error(exception)
      end
    end

    @results
  end
end
