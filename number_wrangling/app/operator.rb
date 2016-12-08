class Operator
  SYMBOLS = [:+, :-, :*, :/].freeze

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol.to_sym
  end

  def <=>(other)
    return true if [:*, :/].any? { |x| x == symbol }

    return true if [:+, :-].any? { |x| x == other.symbol }

    return false
  end
end
