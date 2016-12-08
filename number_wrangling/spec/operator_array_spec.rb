require 'pry-byebug'

RSpec.describe OperatorArray do
  let(:length) { 0 }

  subject { described_class.new(length) }

  context "#each" do
    context 'for length = 1' do
      let(:length) { 1 }

      it "returns 4 possibilities" do
        array = []
        subject.each { |item| array << item }

        expect(array).to eq([
          [:*], [:/], [:+], [:-]
        ])
      end
    end

    context 'for length = 2' do
      let(:length) { 2 }

      it "returns 16 possibilities" do
        array = []
        subject.each { |item| array << item }

        expect(array).to eq([
          [:*, :*], [:*, :/], [:*, :+], [:*, :-],
          [:/, :*], [:/, :/], [:/, :+], [:/, :-],
          [:+, :*], [:+, :/], [:+, :+], [:+, :-],
          [:-, :*], [:-, :/], [:-, :+], [:-, :-]
        ])
      end
    end

    context 'for length = 0' do
      let(:length) { 0 }

      it 'should return an empty array' do
        array = []
        subject.each { |item| array << item }

        expect(array).to be_empty
      end
    end

    context 'for length = -1' do
      let(:length) { -1 }

      it 'should return an empty array' do
        array = []
        subject.each { |item| array << item }

        expect(array).to be_empty
      end
    end
  end
end
