require "./lib/huffman"

my_huffman = Huffman.new("MISSISSIPPI")
my_huffman.create_tree
my_huffman.create_encodings
my_huffman.tree.pretty_print
p my_huffman.encoding
