require "./lib/node"
describe Node do
  describe "#node.value" do
    it "returns node.value" do
      node = Node.new(2)
      expect(node.value).to eql(2)
    end
  end
end
