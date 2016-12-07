RSpec.describe StringDemystifier do
  let(:string) { '' }
  subject { described_class.new(string) }

  context '#demystify' do
    let(:string) { 'HelllWllolllLll Nad!' }
    let(:expected) { 'daN llleH' }

    it "'HelllWllolllLll Nad!' should become 'daN llleH'" do
      expect(subject.demystify).to eq(expected)
    end
  end
end
