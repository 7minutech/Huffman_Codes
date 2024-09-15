class Huffman
  attr_accessor :word, :frequencies, :sorted_frequencies

  def initialize(word = nil)
    @word = word
    @frequencies = {}
    @sorted_frequencies = []
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

  def sort_frequencies
    sorted_hash_by_value = @frequencies.sort_by { |_key, value| value }
    @sorted_frequencies = sorted_hash_by_value.reverse!
  end

  def least_two_frequencies
    least_freqencies = []
    2.times { least_freqencies.push(@sorted_frequencies.pop) }
    least_freqencies
  end
end
