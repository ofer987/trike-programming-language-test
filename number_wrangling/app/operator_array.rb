class OperatorArray
  include Enumerable

  def initialize(count)
    @count = count.to_i
  end

  def each(&block)
    each_internal([], @count, block)
  end

  private

  def each_internal(values, remaining_count, &block)
    remaining_count -= 1

    if remaining_count == 0
      block.call(values + [Nil::Operator.new])

      return
    end

    Operators.each do |operator|
      each_internal(values + [operator], remaining_count, block)
    end
  end
end
