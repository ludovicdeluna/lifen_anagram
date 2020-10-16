# frozen_string_literal: true

# 1. Monter le fichier
# 2. Associer à chaque ligne une version standardisée + ordonnée
# 3. Regrouper par la version ordonnée et fournir le mot associé

# Approche:
# 2 tableaux en conservant l'index

require "benchmark"
require "csv"
require_relative("lib/anagram")

module AnagramApp
  extend self
  attr_reader :file_path, :words, :letters

  @file_path = "inputs/french_words.txt"

  def start
    anagram = Anagram.new(CSV.read(file_path))
    File.open("output/anagrams.txt", "w") { |io| io.write(anagram.classify_by_row) }
  end
end

puts Benchmark.measure { AnagramApp.start }
