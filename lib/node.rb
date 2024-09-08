class Node
  def initialize(value,frequency)
    attr_accessor :value, :frequency, :left_node, :right_node
    @value = value
    @frequency = frequency
    @left_node = nil
    @right_node = nil
  end
end
