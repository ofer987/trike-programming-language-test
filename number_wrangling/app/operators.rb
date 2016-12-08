class Operators
  include Enumerable

  SYMBOLS = [:+, :-, :*, :/].freeze

  def each(&block)
    SYMBOLS.each do |symbol|
      block.call(Operator.new(symbol))
    end
  end
end
