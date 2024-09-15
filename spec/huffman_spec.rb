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
end
