require_relative "tree"
require_relative "node"
# describes a class which can use Huffman Codes
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

  # puts the frequency of each char in a hash
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

  # removes two least frequencies
  # and replaces with new node
  def add_subtree
    2.times { sorted_frequencies.pop }
    sorted_frequencies.push [tree.root, tree.root.value]
  end

  # creats subtree with two least frequent chars
  def create_subtree
    left_node = least_two_frequencies[0][0]
    right_node = least_two_frequencies[1][0]
    left_node = Node.new(left_node) unless left_node.is_a?(Node)
    right_node = Node.new(right_node) unless right_node.is_a?(Node)
    @tree.root = Node.new(least_two_frequencies[0][1] + least_two_frequencies[1][1])
    @tree.root.right_node = right_node
    @tree.root.left_node = left_node
  end

  # creats entire tree from word
  def create_tree
    sort_frequencies_to_arr
    until sorted_frequencies.length == 1
      # binding.pry
      create_subtree
      add_subtree
      @sorted_frequencies = @sorted_frequencies.sort_by(&:last).reverse!
    end
  end

  # creats the huffman codes
  # for tree traversal
  def create_encodings
    @frequencies.each_key do |char|
      @encoding[char] = tree.create_encoding(char.to_s)
    end
    @encoding
  end

  # traverse tree using huffman code
  def find_using_code(char)
    code = @encoding[char.to_sym]
    node = @tree.root
    code.each do |value|
      node = @tree.root.right_node if value == 1
      node = @tree.root.left_node if value.zero?
    end
    node.value
  end
end
