require "./lib/node"
describe Node do
  describe "#node.value" do
    it "returns node.value" do
      node = Node.new("A", 2)
      expect(node.value).to eql("A")
    end
  end
  describe "#node.frequency" do
    it "returns node.frequency" do
      node = Node.new("A", 2)
      expect(node.frequency).to eql(2)
    end
  end
end
