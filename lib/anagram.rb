require "i18n"
I18n.available_locales = [:en]

class Anagram
  attr_reader :word_list

  def initialize(word_list)
    @word_list = word_list
  end

  def classify_by_row
    classify.map { |row| row.join(', ') }.join("\n")
  end

  def classify
    generate_anagrams(extract_letters)
  end

  def extract_letters
    word_list.map { |word| [word, I18n.transliterate(word.to_s.upcase).chars.sort.join] }
  end

  def generate_anagrams(words_with_letters)
    words_with_letters.group_by { |(v, k)| k }.map { |k, arry| arry.map(&:first) }
  end
end
