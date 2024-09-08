require "./lib/node"
describe Node do
  describe "#new" do 
    it "returns node.value" do
      node = Node.new("A",2)
      expect(node.value).to eql("A")
      expect(node.frequency).to eql("2")
    end
  end
end
