class Huffman
  attr_accessor :word, :frequencies

  def initialize(word = nil)
    @word = word
    @frequencies = {}
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

  def sort_values
    sorted_hash_by_value = @frequencies.sort_by { |_key, value| value }
    sorted_hash_by_value.reverse!
    p sorted_hash_by_value
  end
end
my_huff = Huffman.new("AABCBAD")
my_huff.map_frequency
my_huff.sort_values
