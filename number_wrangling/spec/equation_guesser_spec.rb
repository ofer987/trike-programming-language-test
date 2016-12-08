RSpec.describe EquationGuesser do
  let(:operands) { [] }
  let(:sum) { 0 }

  subject { described_class.new(operands, sum) }

  context '#guess' do
    context 'two operands' do
      let(:operands) { [1, 2] }
      let(:sum) { 3 }
      let(:attempts) { 2 }

      it 'returns an array' do
        expect(subject.guess(attempts)).to be_an Array
      end

      it 'returns an array of Result' do
        subject.guess(attempts).all? { |result| expect(result).to be_a Result }
      end

      it 'guesses the following Results' do
        # guesses = subject.guess(attempts)
        # guess = guesses.first

        # expect(guess.operation).to eq('1 + 2')
        # expect(guess.sum).to eq(3)
        # expect(guess.expected?).to eq(true)
        expect(subject.guess(attempts)).to eq([
          Result.new('1 + 2', 3, 3)
        ])
      end
    end

    context 'three operands' do
      let(:operands) { [1, 2, 3] }
      let(:sum) { 5 }
      let(:attempts) { 10 }

      it 'returns an array' do
        expect(subject.guess(attempts)).to be_an Array
      end

      it 'returns an array of Result' do
        subject.guess(attempts).all? { |result| expect(result).to be_a Result }
      end

      it 'guesses the following Results' do
        # guesses = subject.guess(attempts)
        # guess = guesses.first

        # expect(guess.operation).to eq('1 + 2')
        # expect(guess.sum).to eq(3)
        # expect(guess.expected?).to eq(true)
        expect(subject.guess(attempts)).to eq([
          Result.new('1 + 2 + 3', 6, 5),
          Result.new('1 + 2 - 3', 0, 5),
          Result.new('1 + 2 * 3', 7, 5),
          Result.new('1 + 2 / 3', 1, 5),
          Result.new('1 - 2 + 3', 2, 5),
        ])
      end
    end
  end
end
