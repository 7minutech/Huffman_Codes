require "./lib/huffman"

require "pry-byebug"

describe Huffman do
  describe "map_frequency" do
    it "returns string given to list with hash with key value pairs" do
      my_huff = Huffman.new("AABCBAD")
      expect(my_huff.map_frequency).to eql({ A: 3, B: 2, C: 1, D: 1 })
    end
  end
  describe "sort_frequencies_to_arr" do
    it "sort the frequencies" do
      my_huff = Huffman.new("AABCBAD")
      expect(my_huff.sort_frequencies_to_arr).to eql([[:A, 3], [:B, 2], [:D, 1], [:C, 1]])
    end
  end
  describe "least_two_frequencies" do
    it "return the two least frequent elements" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.sort_frequencies_to_arr
      expect(my_huff.least_two_frequencies).to eql([[:C, 1], [:D, 1]])
    end
  end
  describe "subtree" do
    it "adds popped elements back to array joined togther" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.sort_frequencies_to_arr
      least_freqencies = my_huff.least_two_frequencies
      expect(my_huff.subtree(least_freqencies)).to eql([:CD, 2])
    end
  end

  describe "create subtree" do
    it "creates subtree" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.sort_frequencies_to_arr
      my_huff.create_subtree
      my_huff.tree.pretty_print
      expect(my_huff.tree.root.value).to eql(2)
    end
    it "creates two subtrees" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.sort_frequencies_to_arr
      my_huff.create_subtree
      my_huff.add_subtree
      my_huff.create_subtree
      my_huff.tree.pretty_print
      expect(my_huff.tree.root.value).to eql(4)
    end
    it "creates three subtrees" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.create_tree
      my_huff.tree.pretty_print
      expect(my_huff.tree.root.value).to eql(7)
    end
    it "creats tree with identical frequincies" do
      my_huff = Huffman.new("AAABBBCCDE")
      my_huff.create_tree
      my_huff.tree.pretty_print
      expect(my_huff.tree.root.value).to eql(10)
      expect(my_huff.tree.root.right_node.value).to eql(6)
    end
  end
  describe "create encodings" do
    it "creates codes for word given" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.create_tree
      my_huff.tree.pretty_print
      expect(my_huff.create_encodings).to eql({ A: [0], B: [1, 0], C: [1, 1, 0], D: [1, 1, 1] })
    end
  end
  describe "find using code" do
    it "search through tree using code" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.create_tree
      my_huff.create_encodings
      my_huff.tree.pretty_print
      expect(my_huff.find_using_code("C")).to eql(:A)
    end
  end
end
