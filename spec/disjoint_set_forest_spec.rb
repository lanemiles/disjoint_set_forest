RSpec.describe DisjointSetForest do
  it "has a version number" do
    expect(DisjointSetForest::VERSION).not_to be nil
  end

  describe "#make_set" do 
    it "should create a new set, with one element, and have that element be the set representative" do 
      disjoint_set = DisjointSetForest::DisjointSetForest.new
      
      new_element = "test"
      disjoint_set.make_set(new_element)
      expect(disjoint_set.find(new_element)).to eq(new_element)
    end
  end

  describe "#find" do
    it "should return the set representative" do
      disjoint_set = DisjointSetForest::DisjointSetForest.new
      root = "root"
      child = "child"
      
      disjoint_set.make_set(root)
      disjoint_set.make_set(child)
      disjoint_set.union(root, child) # when ranks equal, right under left

      expect(disjoint_set.find(child)).to eq(root)
    end
  end

  describe "#union" do
    it "should make the set representatives for the two elements the same" do
      disjoint_set = DisjointSetForest::DisjointSetForest.new
      x = "x"
      y = "y"

      disjoint_set.make_set(x)
      disjoint_set.make_set(y)
      disjoint_set.union(x, y)

      expect(disjoint_set.find(x)).to eq(disjoint_set.find(y))
    end
  end

end
