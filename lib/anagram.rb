# frozen_string_literal: true
require "i18n"
I18n.available_locales = [:en]

class Anagram
  attr_reader :word_list

  def initialize(word_list)
    @word_list = word_list
  end

  # First method: With array and group_by function

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

  # Second method: With hash

  def generate_hsh
    word_list.each_with_object({}) do |word, hsh|
      (hsh[I18n.transliterate(word.upcase).chars.sort.join] ||= []) << word
    end
  end

  def classify_with_hsh
    generate_hsh.values
  end
end
