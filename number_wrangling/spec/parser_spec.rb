RSpec.describe Parser do
  let(:string) { '1 + 2 + 3 + 4' }

  subject { described_class.new(string) }

  context '1 + 2 + 3 + 4' do
    it 'should return three operations ' do
      expect(subject.operation).to be_an Operation
    end
  end
end
