# frozen_string_literal: true

# Compute anagram with two methods
# - With array and group_by function (default of #start method)
# - With hash

require "benchmark"
require "csv"
require_relative("lib/anagram")

module AnagramApp
  extend self
  attr_reader :file_path, :words, :letters

  @file_path = "inputs/french_words.txt"

  def start
    show_bench("Generate CSV") do
      File.open("output/anagrams.txt", "w") { |io| io.write(anagram.classify_by_row) }
    end
  end

  def bench_with_group_by
    show_bench("Array with group_by") { anagram.classify }
  end

  def bench_with_hsh
    show_bench("Hash") { anagram.generate_hsh }
  end

  def anagram
    @anagram ||= Anagram.new(File.readlines(file_path, chomp: true).compact)
  end

  def show_bench(label, &block)
    puts "#{label.ljust(20)}: #{Benchmark.measure(&block)}"
  end
end

# Generate results in the output folder
AnagramApp.start

# Benchmark the two methods
AnagramApp.bench_with_group_by
AnagramApp.bench_with_hsh
