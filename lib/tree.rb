require "pry-byebug"
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

  def create_encoding(char, node = @root, code = [])
    # Base case
    return code if node.value.to_s == char

    # Search the left subtree
    unless node.left_node.nil?
      result = create_encoding(char, node.left_node, code + [0])
      return result unless result.nil? # If a match was found, return the result
    end

    # Search the right subtree
    unless node.right_node.nil?
      result = create_encoding(char, node.right_node, code + [1])
      return result unless result.nil? # If a match was found, return the result
    end

    # If no match is found in either subtree, return nil
    nil
  end
end
