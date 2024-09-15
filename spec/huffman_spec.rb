require "./lib/huffman"

describe Huffman do
  describe "map_frequency" do
    it "returns string given to list with hash with key value pairs" do
      my_huff = Huffman.new("AABCBAD")
      expect(my_huff.map_frequency).to eql({ A: 3, B: 2, C: 1, D: 1 })
    end
  end
  describe "sort_frequencies" do
    it "sort the frequencies" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.map_frequency
      expect(my_huff.sort_frequencies).to eql([[:A, 3], [:B, 2], [:D, 1], [:C, 1]])
    end
  end
  describe "least_two_frequencies" do
    it "return the two least frequent elements" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.map_frequency
      my_huff.sort_frequencies
      expect(my_huff.least_two_frequencies).to eql([[:C, 1], [:D, 1]])
    end
  end
  describe "subtree" do
    it "adds popped elements back to array joined togther" do
      my_huff = Huffman.new("AABCBAD")
      my_huff.map_frequency
      my_huff.sort_frequencies
      least_freqencies = my_huff.least_two_frequencies
      expect(my_huff.subtree(least_freqencies)).to eql([:CD, 2])
    end
  end
  describe "add subtree" do
    it "adds subtree to sorted frequncies" do
      my_huff = Huffman.new("AABCCBADF")
      my_huff.map_frequency
      my_huff.sort_frequencies
      my_huff.add_subtree
      expect(my_huff.sorted_frequencies).to eql([[:A, 3], [:B, 2], [:CD, 2]])
    end
  end
end
