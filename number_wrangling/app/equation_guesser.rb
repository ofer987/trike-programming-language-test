class EquationGuesser
  def initialize(operands, expected_total)
    @operands = Array(operands).map(&:to_i)
    @expected_total = expected_total.to_i
  end

  def guess(attempts)
    attempts = attempts.to_i

    results = Calculator
      .new(@operands, @expected_total, attempts)
      .results

    print(results)
    print_summary(results)

    results
  end

  private

  def print(results)
    results.each { |result| puts result }
  end

  def print_summary(results)
    best_guess = results
      .sort { |x, y| (x.total - @expected_total).abs <=> (y.total - @expected_total).abs }
      .first

    puts "Guesses: #{results.count} Best Guess: #{best_guess}"
  end
end
