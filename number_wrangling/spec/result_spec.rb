RSpec.describe Result do
  context '#==' do
    context 'have the same values' do
      let(:value) { Result.new('1 + 2', 3, 3) }
      let(:other) { Result.new('1 + 2', 3, 3) }

      it 'expect to be equal' do
        expect(value).to eq(other)
      end
    end
  end
end
