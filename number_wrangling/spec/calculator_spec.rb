RSpec.describe Calculator do
  let(:operands) { [] }
  let(:expected_total) { 0 }
  let(:attempts) { 0 }

  subject { described_class.new(operands, expected_total, attempts) }

  context "#results" do
    let(:operands) { [1, 2, 3, 4, 5] }
    let(:expected_total) { 20 }
    let(:attempts) { 5 }

    let(:expected) do
      [
        Result.new('1 * 2 * 3 * 4 * 5', 120, expected_total),
        Result.new('1 * 2 * 3 * 4 / 5', 4, expected_total),
        Result.new('1 * 2 * 3 * 4 + 5', 29, expected_total),
        Result.new('1 * 2 * 3 * 4 - 5', 19, expected_total),
        Result.new('1 * 2 * 3 / 4 * 5', 5, expected_total)
      ]
    end

    it 'to try five times' do
      expect(subject.results.count).to eq(5)
    end

    it 'to equal five results' do
      expect(subject.results).to eq(expected)
    end

    context 'guessed correctly' do
      let(:operands) { [1, 2, 3] }
      let(:expected_total) { 5 }
      let(:attempts) { 5 }

      it 'returns early' do
        expect(subject.results.count).to eq(3)
      end
    end

    context 'division by 0' do
      let(:operands) { [1, 2, 0] }
      let(:expected_total) { 20 }
      let(:attempts) { 5 }

      it 'does not crash' do
        expect{ subject.results }.not_to raise_error
      end
    end
  end
end
