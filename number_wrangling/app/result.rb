class Result
  attr_reader :operation, :sum, :expected_sum

  def initialize(operation, sum, expected_sum)
    @operation = operation.to_s
    @sum = sum.to_i
    @expected_sum = expected_sum.to_i
  end

  def diff
    sum - @expected_sum
  end

  def expected?
    diff == 0
  end

  def ==(other)
    operation == other.operation && sum == other.sum && expected_sum == other.expected_sum
  end
end
