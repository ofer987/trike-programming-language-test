require 'enumerator'

class OperatorArray
  include Enumerable

  OPERATORS = [:*, :/, :+, :-].freeze

  def initialize(length)
    @length = length.to_i
  end

  def each(&block)
    each_internal([], @length, &block)
  end

  private

  def each_internal(values, remaining_length, &block)
    if remaining_length <= 0
      block.call(values) if values.any?

      return
    end

    remaining_length -= 1

    OPERATORS.each do |operator|
      each_internal(values + [operator], remaining_length, &block)
    end
  end
end
