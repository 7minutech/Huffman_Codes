class Tree
  attr_accessor :root

  def initialize
    @root = Node.new(nil)
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    puts
    pretty_print(node.right_node, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_node
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_node, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_node
  end
end
