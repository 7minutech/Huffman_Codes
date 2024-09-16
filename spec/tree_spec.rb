require "./lib/huffman"

describe "creat encoding" do
  it "creats code for a char" do
    my_huff = Huffman.new("AAABBBCCDE")
    my_huff.create_tree
    my_huff.tree.pretty_print
    expect(my_huff.tree.create_encoding("A")).to eql([1, 0])
  end
end
