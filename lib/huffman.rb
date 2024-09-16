require "pry-byebug"
require_relative "tree"
require_relative "node"
class Huffman
  attr_accessor :word, :frequencies, :sorted_frequencies, :tree, :encoding

  def initialize(word = nil)
    @word = word
    @frequencies = {}
    map_frequency
    @sorted_frequencies = []
    @tree = Tree.new
    @encoding = {}
  end

  def map_frequency
    frequency_hash = {}
    word.chars.each do |char|
      if frequency_hash[char.to_sym]
        frequency_hash[char.to_sym] += 1
      else
        frequency_hash[char.to_sym] = 1
      end
    end
    frequency_hash.sort
    @frequencies = frequency_hash
  end

  def sort_frequencies_to_arr
    sorted_hash_by_value = @frequencies.sort_by { |_key, value| value }
    @sorted_frequencies = sorted_hash_by_value.reverse!
  end

  def least_two_frequencies
    (1..2).map { |i| @sorted_frequencies[-i] }
  end

  def subtree(least_freqencies)
    next_entry = []
    new_symbol = ""
    new_frequency = 0
    least_freqencies.each do |element|
      new_symbol += element[0].to_s
      new_frequency += element[1].to_i
    end
    next_entry.push new_symbol.to_sym
    next_entry.push new_frequency
    next_entry
  end

  def add_subtree
    2.times { sorted_frequencies.pop }
    sorted_frequencies.push [tree.root, tree.root.value]
  end

  def create_subtree
    left_node = least_two_frequencies[0][0]
    right_node = least_two_frequencies[1][0]
    left_node = Node.new(left_node) unless left_node.is_a?(Node)
    right_node = Node.new(right_node) unless right_node.is_a?(Node)
    @tree.root = Node.new(least_two_frequencies[0][1] + least_two_frequencies[1][1])
    @tree.root.right_node = right_node
    @tree.root.left_node = left_node
  end

  def create_tree
    sort_frequencies_to_arr
    until sorted_frequencies.length == 1
      # binding.pry
      create_subtree
      add_subtree
      @sorted_frequencies = @sorted_frequencies.sort_by(&:last).reverse!
    end
  end

  def create_encodings
    @frequencies.each_key do |char|
      @encoding[char] = tree.create_encoding(char.to_s)
    end
    @encoding
  end
end
