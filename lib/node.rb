# describes a node object with a value, frequency and left and right nodes
class Node
  attr_accessor :value, :frequency, :left_node, :right_node

  def initialize(value, frequency)
    @value = value
    @frequency = frequency
    @left_node = nil
    @right_node = nil
  end
end
