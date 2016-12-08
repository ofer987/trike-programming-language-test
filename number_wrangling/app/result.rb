class Result
  attr_reader :operation, :total, :expected_total

  def initialize(operation, total, expected_total)
    @operation = operation.to_s
    @total = total.to_i
    @expected_total = expected_total.to_i
  end

  def diff
    total - @expected_total
  end

  def expected?
    diff == 0
  end

  def ==(other)
    operation == other.operation &&
      total == other.total &&
      expected_total == other.expected_total
  end

  def to_s
    "#{@operation} = #{@total} (#{diff})"
  end
end
