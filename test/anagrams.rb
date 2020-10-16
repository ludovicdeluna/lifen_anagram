require "minitest/autorun"
require_relative "../draft.rb"

describe "validate linkage between initial entry and sanitized & ordered letters" do
  it "group words by index" do
    words = ["aaa", "bbb", "AAA", "BBB", "aAa"]
    letters = ["AAA", "BBB", "AAA", "BBB", "AAA"]
    full_list = words.zip(letters)
    # => [["aaa", "AAA"], ["bbb", "BBB"], ["AAA", "AAA"], ["BBB", "BBB"]]

    full_list.group_by { |(v, k)| k }
    # => {"AAA"=>[["aaa", "AAA"], ["AAA", "AAA"]], "BBB"=>[["bbb", "BBB"], ["BBB", "BBB"]]}

    anagrams = App.generate_anagrams(full_list)
    _(anagrams).must_equal [["aaa", "AAA", "aAa"], ["bbb", "BBB"]]
  end
end
