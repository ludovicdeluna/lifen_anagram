require "minitest/autorun"
require_relative "../lib/anagram"

describe Anagram do
  subject { Anagram.new(words) }

  let(:anagram_1) { %w(crane écran nacre carne rance ancre) }
  let(:anagram_2) { %w(couille luciole) }
  let(:anagram_3) { %w(aimer maire ramie) }

  let(:words) { anagram_1 + anagram_2 + anagram_3 }

  it "#extract_letters" do
    _(subject.extract_letters).must_equal ([["crane", "ACENR"], ["écran", "ACENR"], ["nacre", "ACENR"], ["carne", "ACENR"], ["rance", "ACENR"], ["ancre", "ACENR"], ["couille", "CEILLOU"], ["luciole", "CEILLOU"], ["aimer", "AEIMR"], ["maire", "AEIMR"], ["ramie", "AEIMR"]])
  end

  it "#classify" do
    _(subject.classify).must_equal [["crane", "écran", "nacre", "carne", "rance", "ancre"], ["couille", "luciole"], ["aimer", "maire", "ramie"]]
  end

  it "#classify_by_row" do
    _(subject.classify_by_row).must_equal "crane, écran, nacre, carne, rance, ancre\ncouille, luciole\naimer, maire, ramie"
  end
end
