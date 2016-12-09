RSpec.describe Result do
  context '#==' do
    context 'have the same values' do
      let(:value) { Result.new('1 + 2', 3, 3) }
      let(:other) { Result.new('1 + 2', 3, 3) }

      it 'expect to be equal' do
        expect(value).to eq(other)
      end
    end

    context 'do not have the same values' do
      let(:value) { Result.new('10 + 3', 13, 30) }
      let(:other) { Result.new('1 + 2', 3, 3) }

      it 'expect to be equal' do
        expect(value).to_not eq(other)
      end
    end
  end

  context '#to_s' do
    context "the operation '10 + 3' and expected total 30" do
      let(:value) { Result.new('10 + 3', 13, 30) }

      it "has string representation '10 + 3 = 13 (-17)'" do
        expect(value.to_s).to eq('10 + 3 = 13 (-17)')
      end
    end
  end
end
