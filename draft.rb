# frozen_string_literal: true

# 1. Monter le fichier
# 2. Associer à chaque ligne une version standardisée + ordonnée
# 3. Regrouper par la version ordonnée et fournir le mot associé

# Approche:
# 2 tableaux en conservant l'index

require "benchmark"
require "csv"

require "i18n"
I18n.available_locales = [:en]

module App
  extend self
  attr_reader :file_path, :words, :letters

  @file_path = "inputs/french_words.txt"

  def start
    @words = CSV.read(file_path)
    @letters = words.map { |str| I18n.transliterate(str.to_s.upcase).chars.sort.join }
    full_list = words.zip(letters)
    io = File.new("output/anagrams.txt", "w")

    anagrams = generate_anagrams(full_list)
    io.write(full_list.map { |arry| arry.join(",") }.join("\n"))
  end

  def generate_anagrams(zipped_list)
    zipped_list.group_by { |(v, k)| k }.map { |k, arry| arry.map(&:first) }
  end
end

puts Benchmark.measure { App.start }
