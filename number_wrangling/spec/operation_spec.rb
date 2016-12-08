RSpec.describe Operation do
  let(:operands) { [1, 2, 3] }
  let(:operators) { [:*, :+] }

  subject { described_class.new(operands, operators)}

  context '#to_s' do
    its(:to_s) { should eq('1 * 2 + 3')}
  end
end
