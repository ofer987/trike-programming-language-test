# require 'rails_helper'

RSpec.describe Functions do
  subject { described_class }

  context '.replace_with_surrounding_character' do
    strings = [
      ['AWA', 'AAA'],
      [' A ', ' A '],
      ['BBB', 'BBB'],
      ['aWa', 'aaa'],
      ['aWaUoU', 'aaaUUU'],
      ['YBHBY', 'YBBBY'],
      ['YBHBUJUY', 'YBBBUUUY']
    ]

    strings.each do |original, expected|
      it "'#{original}' should become '#{expected}'" do
        expect(subject.replace_with_surrounding_character(original)).to eq(expected)
      end
    end
  end

  context '.replace_six_characters' do
    strings = [
      ['AAAAAA', 'A'],
      ['     ', '     '],
      ['      ', ' '],
      ['BBBBBB', 'B'],
      ['aaaaaaBBBBBB', 'aB'],
      ['aaaaaaaaBBBBBB', 'aaaB'],
      ['aaaabbbBBB', 'aaaabbbBBB']
    ]

    strings.each do |original, expected|
      it "'#{original}' should become '#{expected}'" do
        expect(subject.replace_six_characters(original)).to eq(expected)
      end
    end
  end

  context '.reverse' do
    strings = [
      ['EGEEJEHT!', 'THEJEEGE'],
      ['hello my name is Dan!', 'naD si eman ym olleh'],
      ['hellO please revErSe! eM!', '!Me eSrEver esaelp Olleh'],
      [' esr!ever ', ' reverse '],
      ['reverse!! ', ' !esrever'],
      [' esr!ever', 'reverse ']
    ]

    strings.each do |original, expected|
      it "'#{original}' should become '#{expected}'" do
        expect(subject.reverse(original)).to eq(expected)
      end
    end
  end
end
